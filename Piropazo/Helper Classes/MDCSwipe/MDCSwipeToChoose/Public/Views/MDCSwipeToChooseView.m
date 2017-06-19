//
// MDCSwipeToChooseView.m
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

#import "MDCSwipeToChooseView.h"
#import "MDCSwipeToChoose.h"
#import "MDCGeometry.h"
#import "UIView+MDCBorderedLabel.h"
#import "UIColor+MDCRGB8Bit.h"
#import <QuartzCore/QuartzCore.h>

//static CGFloat const MDCSwipeToChooseViewHorizontalPadding = 10.f;
//static CGFloat const MDCSwipeToChooseViewTopPadding = 20.f;
//static CGFloat const MDCSwipeToChooseViewLabelWidth = 65.f;

@interface MDCSwipeToChooseView ()
@property (nonatomic, strong) MDCSwipeToChooseViewOptions *options;
@end

@implementation MDCSwipeToChooseView

#pragma mark - Object Lifecycle

- (instancetype)initWithFrame:(CGRect)frame options:(MDCSwipeToChooseViewOptions *)options
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _options = options ? options : [MDCSwipeToChooseViewOptions new];
        [self constructImageView];
        [self longPress];
        [self setupView];

        NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
        if ([[userDefault valueForKey:@"wayToSwipe"] isEqualToString:@"twoWay"])
        {
            [self constructLikedView];
            [self constructNopeImageView];
//            [self constructDismissImageView];
        }
        else
        {
            [self constructLikedView];
            [self constructNopeImageView];
            [self constructDismissImageView];
        }
        

        [self setupSwipeToChoose];
    }
    return self;
}

#pragma mark - Internal Methods
- (void)setupView
{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5.f;
    [self.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.layer setShadowOpacity:0.8];
    [self.layer setShadowRadius:5.0];
    [self.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
}

- (void)constructImageView
{
    self.mainBGView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.mainBGView.layer.cornerRadius = 5.0;
    self.mainBGView.clipsToBounds = YES;
    [self addSubview:self.mainBGView];
}

- (void)constructLikedView
{
    self.likedView = [[UIImageView alloc] initWithFrame:self.bounds];
    
//    [self.likedView setFrame:CGRectMake(self.likedView.frame.origin.x, self.likedView.frame.origin.y, 300, self.likedView.frame.size.height)];
    [self.likedView setFrame:CGRectMake(self.likedView.frame.origin.x, self.likedView.frame.origin.y, self.frame.size.width, self.likedView.frame.size.height)];
    self.likedView.backgroundColor = SwipeGreenColor;
    self.likedView.layer.masksToBounds = YES;
    self.likedView.opaque =YES;
    self.likedView.opaque = 5.0;
    self.likedView.alpha = 0.f;
    [self.likedView setUserInteractionEnabled:YES];
    [self.likedView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|
     UIViewAutoresizingFlexibleHeight];
    self.likedView.layer.cornerRadius = 5;
    [self addSubview:self.likedView];
    
    
    /*UIImageView * imageheart = [[UIImageView  alloc]initWithFrame:CGRectMake(self.likedView.frame.size.width/2-20, self.likedView.frame.size.height/2-25, 50, 50)];
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    if ([[userDefault valueForKey:@"wayToSwipe"] isEqualToString:@"twoWay"]){
        [imageheart setImage:[UIImage imageNamed:@"heart_highlight.png"]];
    }else{
        [imageheart setImage:[UIImage imageNamed:@"SHARE.png"]];
    }
    imageheart.contentMode = UIViewContentModeScaleAspectFit;
    imageheart.clipsToBounds=YES;
    [self.likedView addSubview:imageheart];*/
}

- (void)constructNopeImageView
{
    self.nopeView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.nopeView setFrame:CGRectMake(self.nopeView.frame.origin.x, self.nopeView.frame.origin.y, self.frame.size.width, self.nopeView.frame.size.height)];
    self.nopeView.backgroundColor = SwipeRedColor;
    self.nopeView.alpha = 0.f;
    self.nopeView.opaque = 5.0;
    [self.nopeView setUserInteractionEnabled:YES];
    [self.nopeView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|
     UIViewAutoresizingFlexibleHeight];
    self.nopeView.layer.cornerRadius = 5;
    [self.nopeView.layer setShadowOpacity:0.8];
    [self addSubview:self.nopeView];
    
//    UIImageView * imageheart = [[UIImageView  alloc]initWithFrame:CGRectMake(self.nopeView.frame.size.width/2-25, self.nopeView.frame.size.height/2-25, 50, 50)];
//    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
//    if ([[userDefault valueForKey:@"wayToSwipe"] isEqualToString:@"twoWay"]){
//        [imageheart setImage:[UIImage imageNamed:@"cross_highlight.png"]];
//    }else{
//        [imageheart setImage:[UIImage imageNamed:@"heart_highlight.png"]];
//    }
//    imageheart.contentMode = UIViewContentModeScaleAspectFit;
//    imageheart.clipsToBounds=YES;
//    [self.nopeView addSubview:imageheart];
}

- (void)constructDismissImageView
{
    self.dissmissView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.dissmissView setFrame:CGRectMake(self.dissmissView.frame.origin.x, self.dissmissView.frame.origin.y, self.frame.size.width, self.dissmissView.frame.size.height)];
    self.dissmissView.backgroundColor = [UIColor clearColor];
    self.dissmissView.alpha = 0.f;
    [self.dissmissView setUserInteractionEnabled:YES];
    [self addSubview:self.dissmissView];
    
    UIImageView * imageheart = [[UIImageView  alloc]initWithFrame:CGRectMake(self.dissmissView.frame.size.width/2-25, self.dissmissView.frame.size.height/2-25, 50, 50)];
    [imageheart setImage:[UIImage imageNamed:@"cross_highlight.png"]];
    imageheart.contentMode = UIViewContentModeScaleAspectFit;
    imageheart.clipsToBounds=YES;
    [self.dissmissView addSubview:imageheart];
}

-(void)longPress
{
    //NSLog(@"long press");
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleBottomMargin;
    
    viewLayer = [[UIView alloc]initWithFrame:self.bounds];
    viewLayer.backgroundColor = [UIColor whiteColor];
    viewLayer.alpha=0;
    viewLayer.autoresizingMask = self.autoresizingMask;
    [self addSubview:viewLayer];
    self.userInteractionEnabled =YES;
    
    self.lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(celllongpressed:)];
    [self.lpgr setDelegate:self];
    [self.lpgr setMinimumPressDuration:0.2];
    //[self.lpgr setNumberOfTapsRequired:2];
    [self.lpgr setAllowableMovement:100.0f];
    [self addGestureRecognizer:self.lpgr];
}

-(void)celllongpressed:(UIGestureRecognizer *)longPress
{
    if ( longPress.state == UIGestureRecognizerStateEnded )
    {
        //NSLog(@"Long ended");
        viewLayer.alpha=0.f;
    } else if(longPress.state == UIGestureRecognizerStateBegan)
    {
        // NSLog(@"long started");
        viewLayer.alpha=0.4;
    }
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}
- (void)setupSwipeToChoose
{
    MDCSwipeOptions *options = [MDCSwipeOptions new];
    options.delegate = self.options.delegate;
    options.threshold = self.options.threshold;

    __block UIView *likedImageView = self.likedView;
    __block UIView *nopeImageView = self.nopeView;
    __block UIView *dismissImageView = self.dissmissView;

    __weak MDCSwipeToChooseView *weakself = self;
    options.onPan = ^(MDCPanState *state)
    {
       // NSLog(@"state.direction %ld",(long)state.direction);
        //NSLog(@"state.thresholdRatio %f",state.thresholdRatio);
        if (state.direction == MDCSwipeDirectionNone) {
            viewLayer.alpha=0.f;
            likedImageView.alpha = 0.f;
            nopeImageView.alpha = 0.f;
             dismissImageView.alpha = 0.f;
        } else if (state.direction == MDCSwipeDirectionLeft) {
//            if (viewLayer.alpha<=0.4)
//            {
//                viewLayer.alpha=0.4;
//            }
//            else
//            {
//                 viewLayer.alpha=(viewLayer.alpha+state.thresholdRatio)/2;
//            }
            nopeImageView.alpha=0.1+state.thresholdRatio-0.5;

//            nopeImageView.alpha = state.thresholdRatio*4;
            likedImageView.alpha = 0.f;
            dismissImageView.alpha = 0.f;
        } else if (state.direction == MDCSwipeDirectionRight) {
//            if (viewLayer.alpha<=0.4)
//            {
//                viewLayer.alpha=0.4;
//            }
//            else
//            {
//                viewLayer.alpha=(viewLayer.alpha+state.thresholdRatio)/2;
//            }\
            viewLayer.alpha=0.4+state.thresholdRatio;
            likedImageView.alpha=0.1+state.thresholdRatio-0.5;

//            likedImageView.alpha = state.thresholdRatio*4;
            nopeImageView.alpha = 0.f;
             dismissImageView.alpha = 0.f;
        }
        else if (state.direction == MDCSwipeDirectionUP)
        {
//            if (viewLayer.alpha<=0.4)
//            {
                viewLayer.alpha=0.1+state.thresholdRatio;
//            }
//            else
//            {
//                viewLayer.alpha=(viewLayer.alpha+state.thresholdRatio)/2;
//            }
            dismissImageView.alpha = state.thresholdRatio*4;
            nopeImageView.alpha = 0.f;
            likedImageView.alpha = 0.f;
        }

        if (weakself.options.onPan) {
            weakself.options.onPan(state);
        }
       // NSLog(@" options.onPan %@", options.onPan);

    };

    [self mdc_swipeToChooseSetup:options];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"Long ended");
//
//    UITouch *touch = [[event allTouches] anyObject];
//    
//    CGPoint location = [touch locationInView: touch.view];
//    
//    viewLayer.center = location;
//    viewLayer.alpha=0.5;
//    
//}
//
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"Long ended");
//
//    UITouch *touch = [[event allTouches] anyObject];
//    
//    if ([touch view] == viewLayer) {
//        
//        CGPoint location = [touch locationInView: self];
//        
//        viewLayer.center = location;
//         viewLayer.alpha=0.5;
//    }
//}
@end
