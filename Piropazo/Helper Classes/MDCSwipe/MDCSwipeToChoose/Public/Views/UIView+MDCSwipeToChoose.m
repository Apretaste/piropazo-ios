//
// UIView+MDCSwipeToChoose.m
//
// Copyright (c) 2014 to present, Brian Gesiak @modocache
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "UIView+MDCSwipeToChoose.h"
#import "MDCSwipeToChoose.h"
#import "MDCViewState.h"
#import "MDCGeometry.h"
#import <objc/runtime.h>

const void * const MDCSwipeOptionsKey = &MDCSwipeOptionsKey;
const void * const MDCViewStateKey = &MDCViewStateKey;

@implementation UIView (MDCSwipeToChoose)

#pragma mark - Public Interface

- (void)mdc_swipeToChooseSetup:(MDCSwipeOptions *)options
{
    self.mdc_options = options ? options : [MDCSwipeOptions new];
    self.mdc_viewState = [MDCViewState new];
    self.mdc_viewState.originalCenter = self.center;

    [self mdc_setupPanGestureRecognizer];
}

- (void)mdc_swipe:(MDCSwipeDirection)direction
{
    [self mdc_swipeToChooseSetupIfNecessary];

    // A swipe in no particular direction "finalizes" the swipe.
    if (direction == MDCSwipeDirectionNone)
    {
        [self mdc_finalizePosition];
        return;
    }

    // Moves the view to the minimum point exceeding the threshold.
    // Transforms and executes pan callbacks as well.
    void (^animations)(void) = ^{
        CGPoint translation = [self mdc_translationExceedingThreshold:self.mdc_options.threshold
                                                            direction:direction];
        self.center = MDCCGPointAdd(self.center, translation);
        [self mdc_rotateForTranslation:translation
                     rotationDirection:MDCRotationAwayFromCenter];
        [self mdc_executeOnPanBlockForTranslation:translation];
    };

    // Finalize upon completion of the animations.
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (finished) { [self mdc_finalizePosition]; }
    };

    [UIView animateWithDuration:self.mdc_options.swipeAnimationDuration
                          delay:0.0
                        options:self.mdc_options.swipeAnimationOptions
                     animations:animations
                     completion:completion];
}

#pragma mark - Internal Methods

- (void)setMdc_options:(MDCSwipeOptions *)options {
    objc_setAssociatedObject(self, MDCSwipeOptionsKey, options, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MDCSwipeOptions *)mdc_options {
    return objc_getAssociatedObject(self, MDCSwipeOptionsKey);
}

- (void)setMdc_viewState:(MDCViewState *)state {
    objc_setAssociatedObject(self, MDCViewStateKey, state, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MDCViewState *)mdc_viewState {
    return objc_getAssociatedObject(self, MDCViewStateKey);
}

#pragma mark Setup

- (void)mdc_swipeToChooseSetupIfNecessary {
    if (!self.mdc_options || !self.mdc_viewState) {
        [self mdc_swipeToChooseSetup:nil];
    }
}

- (void)mdc_setupPanGestureRecognizer {
    SEL action = @selector(mdc_onSwipeToChoosePanGestureRecognizer:);
    UIPanGestureRecognizer *panGestureRecognizer =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:action];
    [self addGestureRecognizer:panGestureRecognizer];
}

#pragma mark Translation

- (void)mdc_finalizePosition {
    MDCSwipeDirection direction = [self mdc_directionOfExceededThreshold];
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    
    if ([[userDefault valueForKey:@"wayToSwipe"] isEqualToString:@"twoWay"])
    {
        switch (direction) {
            case MDCSwipeDirectionRight:
            case MDCSwipeDirectionLeft: {
                CGPoint translation = MDCCGPointSubtract(self.center,
                                                         self.mdc_viewState.originalCenter);
                [self mdc_exitSuperviewFromTranslation:translation];
                break;
            }
            case MDCSwipeDirectionUP:
            case MDCSwipeDirectionNone:
                [self mdc_returnToOriginalCenter];
                [self mdc_executeOnPanBlockForTranslation:CGPointZero];
                break;
        }
    }
    else
    {
        switch (direction) {
            case MDCSwipeDirectionRight:
            case MDCSwipeDirectionUP:
            case MDCSwipeDirectionLeft: {
                CGPoint translation = MDCCGPointSubtract(self.center,
                                                         self.mdc_viewState.originalCenter);
                [self mdc_exitSuperviewFromTranslation:translation];
                break;
            }
            case MDCSwipeDirectionNone:
                [self mdc_returnToOriginalCenter];
                [self mdc_executeOnPanBlockForTranslation:CGPointZero];
                break;
        }
    }
}

- (void)mdc_returnToOriginalCenter {
    [UIView animateWithDuration:self.mdc_options.swipeCancelledAnimationDuration
                          delay:0.0
                        options:self.mdc_options.swipeCancelledAnimationOptions
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                         self.center = self.mdc_viewState.originalCenter;
                     } completion:^(BOOL finished) {
                         id<MDCSwipeToChooseDelegate> delegate = self.mdc_options.delegate;
                         if ([delegate respondsToSelector:@selector(viewDidCancelSwipe:)]) {
                             [delegate viewDidCancelSwipe:self];
                         }
                     }];
}

- (void)mdc_exitSuperviewFromTranslation:(CGPoint)translation {
    MDCSwipeDirection direction = [self mdc_directionOfExceededThreshold];
    id<MDCSwipeToChooseDelegate> delegate = self.mdc_options.delegate;
    if ([delegate respondsToSelector:@selector(view:shouldBeChosenWithDirection:)]) {
        BOOL should = [delegate view:self shouldBeChosenWithDirection:direction];
        if (!should) {
            return;
        }
    }

    MDCSwipeResult *state = [MDCSwipeResult new];
    state.view = self;
    state.translation = translation;
    state.direction = direction;
    state.onCompletion = ^{
        if ([delegate respondsToSelector:@selector(view:wasChosenWithDirection:)]) {
            [delegate view:self wasChosenWithDirection:direction];
        }
    };
    self.mdc_options.onChosen(state);
}

- (void)mdc_executeOnPanBlockForTranslation:(CGPoint)translation
{
    if (self.mdc_options.onPan) {
        CGFloat thresholdRatio = MIN(1.f, fabsf(translation.x)/self.mdc_options.threshold);
        CGFloat thresholdRatio_Y = MIN(1.f, fabsf(translation.y)/self.mdc_options.threshold);

        MDCSwipeDirection direction = MDCSwipeDirectionNone;
        
        NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
        if ([[userDefault valueForKey:@"wayToSwipe"] isEqualToString:@"twoWay"])
        {
            if (translation.y <= 50.f )
            {
                if (translation.x > 0.f  )
                {
                    direction = MDCSwipeDirectionRight;
                }
                else if (translation.x < 0.f )
                {
                    direction = MDCSwipeDirectionLeft;
                }
            }
        }else{
            if (translation.y <= 0.f &&  translation.x <=30.0f)
            {
                if (translation.x >-30.0f)
                {
                    direction = MDCSwipeDirectionUP;
                }else if (translation.x >= 0.f  )
                {
                    direction = MDCSwipeDirectionRight;
                }
                else if (translation.x <= 0.f )
                {
                    direction = MDCSwipeDirectionLeft;
                }
                
            }
            else if (translation.x >= 0.f   && translation.y <= 50.f) {
                direction = MDCSwipeDirectionRight;
            }
            else if (translation.x <= 0.f  && translation.y <= 50.f)
            {
                direction = MDCSwipeDirectionLeft;
            }
        }
        
        
        //NSLog(@"direction %ld",(long)direction);
        // NSLog(@"translation.y %f  translation.x %f",translation.y,translation.x);
        

        MDCPanState *state = [MDCPanState new];
        state.view = self;
        state.direction = direction;
//        if (translation.y > 0.f)
//        {
//            state.thresholdRatio=thresholdRatio;
//        }
//        else
//        {
//            state.thresholdRatio=(thresholdRatio_Y+thresholdRatio)/2;
//            
//        }
       state.thresholdRatio=thresholdRatio_Y+thresholdRatio;
//        if (translation.y < 0.f) {
//            translation.y < 0.f = thresholdRatio_Y;
//        }else{
//            state.thresholdRatio = thresholdRatio;
//        }
        
        self.mdc_options.onPan(state);
    }
}

#pragma mark Rotation

- (void)mdc_rotateForTranslation:(CGPoint)translation
               rotationDirection:(MDCRotationDirection)rotationDirection {
    CGFloat rotation = MDCDegreesToRadians(translation.x/100 * self.mdc_options.rotationFactor);
    self.transform = CGAffineTransformRotate(CGAffineTransformIdentity,
                                             rotationDirection * rotation);
}

#pragma mark Threshold

- (CGPoint)mdc_translationExceedingThreshold:(CGFloat)threshold
                                   direction:(MDCSwipeDirection)direction {
    NSParameterAssert(direction != MDCSwipeDirectionNone);

    CGFloat offset = threshold + 1.f;
    switch (direction) {
        case MDCSwipeDirectionLeft:
            return CGPointMake(-offset, 0);
        case MDCSwipeDirectionRight:
            return CGPointMake(offset, 0);
        case MDCSwipeDirectionUP:
            return CGPointMake(-0, -0);
        default:
            [NSException raise:NSInternalInconsistencyException
                        format:@"Invallid direction argument."];
            return CGPointZero;
    }
}

- (MDCSwipeDirection)mdc_directionOfExceededThreshold
{
    if (self.center.x > self.mdc_viewState.originalCenter.x + self.mdc_options.threshold) {
        return MDCSwipeDirectionRight;
    } else if (self.center.x < self.mdc_viewState.originalCenter.x - self.mdc_options.threshold) {
        return MDCSwipeDirectionLeft;
    }else if (self.center.y < self.mdc_viewState.originalCenter.y - self.mdc_options.threshold) {
        return MDCSwipeDirectionUP;
    }
    else {
        return MDCSwipeDirectionNone;
    }
}

#pragma mark Gesture Recognizer Events

- (void)mdc_onSwipeToChoosePanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    UIView *view = panGestureRecognizer.view;
 //   NSLog(@"panGestureRecognizer.state %ld",(long)panGestureRecognizer.state);
           CGPoint point = [panGestureRecognizer locationInView:view];
 
   // NSLog(@"Y value %f and x valye %f",point.y,point.x);
   // NSLog(@" mdc_viewState Y value %f and mdc_viewState x valye %f",self.mdc_viewState.originalCenter.y,self.mdc_viewState.originalCenter.x);


   
        if (panGestureRecognizer.state == UIGestureRecognizerStateBegan)
        {
            self.mdc_viewState.originalCenter = view.center;
          //  NSLog(@" mdc_viewState2 Y value %f and mdc_viewState 2 x valye %f",self.mdc_viewState.originalCenter.y,self.mdc_viewState.originalCenter.x);
            
            // If the pan gesture originated at the top half of the view, rotate the view
            // away from the center. Otherwise, rotate towards the center.
            if ([panGestureRecognizer locationInView:view].y < view.center.y)
            {
                self.mdc_viewState.rotationDirection = MDCRotationAwayFromCenter;
            } else
            {
                self.mdc_viewState.rotationDirection = MDCRotationTowardsCenter;
            }//Hari
        }else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
        {
            // Either move the view back to its original position or move it off screen.
            [self mdc_finalizePosition];
            } else
            {
            // Update the position and transform. Then, notify any listeners of
            // the updates via the pan block.
            CGPoint translation = [panGestureRecognizer translationInView:view];
//            if (view.frame.origin.y<=1)
//            {
                view.center = MDCCGPointAdd(self.mdc_viewState.originalCenter, translation);
            //}
//            else
//            {
               // view.center = MDCCGPointAdd(self.mdc_viewState.originalCenter, translation);
                [self mdc_rotateForTranslation:translation
                             rotationDirection:self.mdc_viewState.rotationDirection];
                [self mdc_executeOnPanBlockForTranslation:translation];
            }
       // }
}

@end
