//
// ChoosePersonView.m
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

#import "ChoosePersonView.h"

@interface ChoosePersonView ()

@end

@implementation ChoosePersonView
@synthesize btnTap,lblName,lblage,imgProfile,imgBorder,imgCrown;

#pragma mark - Object Lifecycle

- (instancetype)initWithFrame:(CGRect)frame options:(MDCSwipeToChooseViewOptions *)options  withDetail:(NSMutableDictionary *)dicDetails
{
    NSLog(@"dicDetails===>%@",dicDetails);
    
    self = [super initWithFrame:frame options:options];
    
    if (self)
    {
        
        //============================== Country ========================//
        arrCountry = [[NSMutableArray alloc]init];
        
        NSMutableDictionary * dicCuba = [[NSMutableDictionary alloc]init];
        [dicCuba setObject:@"Cuba" forKey:@"English_name"];
        [dicCuba setObject:@"Cuba" forKey:@"Spanish_name"];
        [dicCuba setObject:@"CU" forKey:@"KeyWord"];
        [dicCuba setObject:@"cuba_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicus = [[NSMutableDictionary alloc]init];
        [dicus setObject:@"U.S.A" forKey:@"English_name"];
        [dicus setObject:@"Estados Unidos" forKey:@"Spanish_name"];
        [dicus setObject:@"US" forKey:@"KeyWord"];
        [dicus setObject:@"us_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicSpain = [[NSMutableDictionary alloc]init];
        [dicSpain setObject:@"Spain" forKey:@"English_name"];
        [dicSpain setObject:@"España" forKey:@"Spanish_name"];
        [dicSpain setObject:@"ES" forKey:@"KeyWord"];
        [dicSpain setObject:@"spain_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicFrance = [[NSMutableDictionary alloc]init];
        [dicFrance setObject:@"France" forKey:@"English_name"];
        [dicFrance setObject:@"Francia" forKey:@"Spanish_name"];
        [dicFrance setObject:@"FR" forKey:@"KeyWord"];
        [dicFrance setObject:@"france_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicGermany = [[NSMutableDictionary alloc]init];
        [dicGermany setObject:@"Germany" forKey:@"English_name"];
        [dicGermany setObject:@"Alemania" forKey:@"Spanish_name"];
        [dicGermany setObject:@"DE" forKey:@"KeyWord"];
        [dicGermany setObject:@"germany_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicVenezuela = [[NSMutableDictionary alloc]init];
        [dicVenezuela setObject:@"Venezuela" forKey:@"English_name"];
        [dicVenezuela setObject:@"Venezuela" forKey:@"Spanish_name"];
        [dicVenezuela setObject:@"VE" forKey:@"KeyWord"];
        [dicVenezuela setObject:@"venezuela_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicItaly = [[NSMutableDictionary alloc]init];
        [dicItaly setObject:@"Italy" forKey:@"English_name"];
        [dicItaly setObject:@"Italia" forKey:@"Spanish_name"];
        [dicItaly setObject:@"IT" forKey:@"KeyWord"];
        [dicItaly setObject:@"italy_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicMexico = [[NSMutableDictionary alloc]init];
        [dicMexico setObject:@"Mexico" forKey:@"English_name"];
        [dicMexico setObject:@"México" forKey:@"Spanish_name"];
        [dicMexico setObject:@"MX" forKey:@"KeyWord"];
        [dicMexico setObject:@"mexico_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicCanada = [[NSMutableDictionary alloc]init];
        [dicCanada setObject:@"Canada" forKey:@"English_name"];
        [dicCanada setObject:@"Canada" forKey:@"Spanish_name"];
        [dicCanada setObject:@"CA" forKey:@"KeyWord"];
        [dicCanada setObject:@"canada_flag.png" forKey:@"flag"];

        
        NSMutableDictionary * dicOther4 = [[NSMutableDictionary alloc]init];
        [dicOther4 setObject:@"Other" forKey:@"English_name"];
        [dicOther4 setObject:@"Otro" forKey:@"Spanish_name"];
        [dicOther4 setObject:@"OTRO" forKey:@"KeyWord"];
        [dicOther4 setObject:@"" forKey:@"flag"];

        
        [arrCountry addObject:dicCuba];
        [arrCountry addObject:dicus];
        [arrCountry addObject:dicSpain];
        [arrCountry addObject:dicFrance];
        [arrCountry addObject:dicGermany];
        [arrCountry addObject:dicVenezuela];
        [arrCountry addObject:dicItaly];
        [arrCountry addObject:dicMexico];
        [arrCountry addObject:dicCanada];
        [arrCountry addObject:dicOther4];
        
        //===========================================================//
        
        self.backgroundColor = [UIColor orangeColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        
        self.mainBGView.autoresizingMask = self.autoresizingMask;

        int yy = 30;
        
        if (IS_IPHONE_6plus ){
            
            yy = 50;
        }
        if (IS_IPHONE_6) {
            yy = 30;

        }
        self.imgBorder = [[UIImageView alloc]init];
        if (IS_IPHONE_6plus || IS_IPHONE_6){
            imgBorder.frame = CGRectMake((frame.size.width/2)-(222/2), yy, 222, 222);
        }else{
            imgBorder.frame = CGRectMake((frame.size.width/2)-(192/2), yy, 192, 192);
        }
        self.imgBorder.clipsToBounds=YES;
        self.imgBorder.layer.cornerRadius = imgBorder.frame.size.width/2;
        self.imgBorder.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.imgBorder.image = [UIImage imageNamed:@"female-circle.png"];
        self.imgBorder.layer.masksToBounds = NO;
        self.imgBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
        self.imgBorder.layer.shadowRadius = 6.0;
        self.imgBorder.layer.shadowOpacity = 0.4;
        if (IS_IPHONE_6plus || IS_IPHONE_6){
            [imgBorder setContentMode:UIViewContentModeScaleAspectFill];
            imgBorder.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin ;;
        }else{
        [imgBorder setContentMode:UIViewContentModeCenter];
        }
        [self.mainBGView addSubview:imgBorder];
        
        NSString * strGender = @"";
               
        if ([dicDetails valueForKey:@"gender"]!=nil && [dicDetails valueForKey:@"gender"]!=[NSNull null])
        {
            strGender = [dicDetails valueForKey:@"gender"];
        }
        
        if ([strGender isEqualToString:@"F"])
        {
//            if (IS_IPHONE_4){
//                self.imgBorder.image = [UIImage imageNamed:@"female-circle_4.png"];
//            }else{
                self.imgBorder.image = [UIImage imageNamed:@"female-circle.png"];
           // }
        }
        else
        {
//            if (IS_IPHONE_4){
//                self.imgBorder.image = [UIImage imageNamed:@"male-circle_4.png"];
//            }else{
                self.imgBorder.image = [UIImage imageNamed:@"male-circle.png"];
            //}
        }
        
        self.imgProfile = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width/2)-(172/2), yy+10, 172, 172)];
        if (IS_IPHONE_6plus||IS_IPHONE_6){
            [self.imgProfile setFrame:CGRectMake((frame.size.width/2)-(202/2), yy+10, 202, 202)];
        }
        self.imgProfile.clipsToBounds=YES;
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width/2;
        self.imgProfile.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin ;;
        [self.imgProfile setContentMode:UIViewContentModeScaleAspectFill];
        if ([dicDetails valueForKey:@"picture_public"]!=nil && [dicDetails valueForKey:@"picture_public"]!=[NSNull null] && ![[dicDetails valueForKey:@"picture_public"]isEqualToString:@""]){
            NSString * strPhoto = [dicDetails valueForKey:@"picture_public"];
//            self.imgProfile.imageURL = [NSURL URLWithString:strPhoto];
            if ([strGender isEqualToString:@"F"])
            {
                [self.imgProfile setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            }else{
               [self.imgProfile setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            }
        }else{
            if ([strGender isEqualToString:@"F"])
            {
              self.imgProfile.image = [UIImage imageNamed:@"female_avtar.png"];
            }
            else
            {
                self.imgProfile.image = [UIImage imageNamed:@"male_avtar.png"];
            }
        }
        [self.mainBGView addSubview:imgProfile];

        
        imgCrown = [[AsyncImageView alloc]initWithFrame:CGRectMake((frame.size.width/2)-(93/2), yy-40, 93, 67)];
        //imgCrown.image = [UIImage imageNamed:@"Female-Crown.png"];
        self.imgCrown.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin ;;
        [self.imgCrown setContentMode:UIViewContentModeScaleAspectFill];
        [imgCrown setContentMode:UIViewContentModeCenter];
        [self.mainBGView addSubview:imgCrown];
        
        NSString * strPicture = @"";
        NSString * strCrown = @"";

        if ([NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"picture"]]!=nil  && ![[NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"picture"]]isEqualToString:@""])
        {
            strPicture = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"picture"]];
        }
        
        if ([NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"crown"]]!=nil  && ![[NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"crown"]]isEqualToString:@""]) {
            strCrown = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"crown"]];
        }
        
        if ([strCrown isEqualToString:@"1"]) {
            
            if ([strPicture isEqualToString:@"1"]){
                
                if ([strGender isEqualToString:@"F"])
                {
                    imgCrown.image = [UIImage imageNamed:@"Female-Crown.png"];
                }
                else{
                    imgCrown.image = [UIImage imageNamed:@"Male-Crown.png"];
                }
            }
  
        }
        
        yy = yy+self.imgBorder.frame.size.height+15;

        
        self.lblName = [[UILabel alloc] initWithFrame:CGRectMake(10, yy, frame.size.width-20, 22)];
//        if (IS_IPHONE_4){
//            self.lblName.frame = CGRectMake(10, frame.size.height-120, frame.size.width-20, 30 );
//        }
        self.lblName.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin|
        UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin;
        [self.lblName setTextColor:merunRed];
        [self.lblName setBackgroundColor:[UIColor clearColor]];
        [self.lblName setTextAlignment:NSTextAlignmentCenter];
        [self.lblName setFont:[UIFont systemFontOfSize:20]];
        if ([dicDetails valueForKey:@"username"]) {
            if (![[dicDetails valueForKey:@"username"] isEqual:[NSNull null]]) {
                self.lblName.text = [NSString stringWithFormat:@"@%@",[dicDetails valueForKey:@"username"]];
            }
        }
        [self.mainBGView addSubview:self.lblName];
        
        
        yy = yy+self.lblName.frame.size.height+5;
        
        
        self.lblage = [[UILabel alloc] initWithFrame:CGRectMake(10, yy, frame.size.width-20, 22)];
//        if (IS_IPHONE_4){
//            self.lblage.frame = CGRectMake(10, frame.size.height-100, frame.size.width-20, 30 );
//        }
        self.lblage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin;
        [self.lblage setTextColor:[UIColor grayColor]];
        [self.lblage setBackgroundColor:[UIColor clearColor]];
        [self.lblage setTextAlignment:NSTextAlignmentCenter];
        [self.lblage setFont:[UIFont systemFontOfSize:20]];
        [self.mainBGView addSubview:self.lblage];

        
        if ([dicDetails valueForKey:@"age"]) {
            if (![[dicDetails valueForKey:@"age"] isEqual:[NSNull null]] && ![[dicDetails valueForKey:@"age"]isEqualToString:@""]){
                self.lblage.text = [NSString stringWithFormat:@"%@ years",[dicDetails valueForKey:@"age"]];
                
                yy = yy+self.lblage.frame.size.height+5;
            }else{
                yy = yy+self.lblName.frame.size.height;
            }
        }
        
        
        self.lblCountry = [[UILabel alloc] initWithFrame:CGRectMake(10, yy, frame.size.width-20, 22)];
//        if (IS_IPHONE_4){
//            self.lblCountry.frame = CGRectMake(10, frame.size.height-65, frame.size.width-20, 30 );
//        }
        self.lblCountry.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin;
        [self.lblCountry setTextColor:[UIColor grayColor]];
        [self.lblCountry setBackgroundColor:[UIColor clearColor]];
        [self.lblCountry setTextAlignment:NSTextAlignmentCenter];
        [self.lblCountry setFont:[UIFont systemFontOfSize:20]];
        [self.mainBGView addSubview:self.lblCountry];

        if ([dicDetails valueForKey:@"country"])
        {
            if (![[dicDetails valueForKey:@"country"] isEqual:[NSNull null]] && ![[dicDetails valueForKey:@"country"]isEqualToString:@""] && [dicDetails valueForKey:@"country"]!=nil){
                
                NSString * strCountry = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"country"]];
                
                NSString * strImage = @"";

                for(int i=0; i<[arrCountry count]; i++)
                {
                    if ([[[arrCountry objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strCountry])
                    {
                        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                            strCountry = [[arrCountry objectAtIndex:i]valueForKey:@"English_name"];
                        }
                        else{
                            strCountry = [[arrCountry objectAtIndex:i]valueForKey:@"Spanish_name"];
                        }
                        NSLog(@"index==>%@",strCountry);
                        strImage = [[arrCountry objectAtIndex:i]valueForKey:@"flag"];
                    }
                }
                
                self.lblCountry.text = strCountry;
//                NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
//                attachment.image = [UIImage imageNamed:@"United_States_of_America.png"];
//                
//                NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
//                
//                NSMutableAttributedString *myString= [[NSMutableAttributedString alloc] initWithString:self.lblCountry.text];
//                [myString appendAttributedString:attachmentString];
//                
//                self.lblCountry.attributedText = myString;
                
//                NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
//                imageAttachment.image = [UIImage imageNamed:@"United_States_of_America.png"];
//                CGFloat imageOffsetY = -5.0;
//                imageAttachment.bounds = CGRectMake(0, imageOffsetY, imageAttachment.image.size.width, imageAttachment.image.size.height);
//                NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
//                NSMutableAttributedString *completeText= [[NSMutableAttributedString alloc] initWithString:@" "];
//                [completeText appendAttributedString:attachmentString];
//                NSMutableAttributedString *textAfterIcon= [[NSMutableAttributedString alloc] initWithString:self.lblCountry.text];
//                [completeText appendAttributedString:textAfterIcon];
//                self.lblCountry.textAlignment=NSTextAlignmentCenter;
//                self.lblCountry.attributedText=completeText;
                
                NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
                attachment.image = [UIImage imageNamed:strImage];
                float offsetY = 0; //This can be dynamic with respect to size of image and UILabel
                attachment.bounds = CGRectIntegral( CGRectMake(0, offsetY, attachment.image.size.width, attachment.image.size.height));
                
                NSMutableAttributedString *attachmentString = [[NSMutableAttributedString alloc] initWithAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
                NSString * str = [NSString stringWithFormat:@" %@",self.lblCountry.text];
                NSMutableAttributedString *myString= [[NSMutableAttributedString alloc] initWithString:str];
                
                [attachmentString appendAttributedString:myString];
                
                self.lblCountry.attributedText = attachmentString;
                
                yy = yy+self.lblCountry.frame.size.height+5;
            }else{
                yy = yy+self.lblage.frame.size.height+5;
            }
        }
        
        self.lblTags = [[UILabel alloc] initWithFrame:CGRectMake(10, yy, frame.size.width-20, 30)];
//        if (IS_IPHONE_4){
//            self.lblTags.frame = CGRectMake(10, frame.size.height-40, frame.size.width-20, 30 );
//        }
        self.lblTags.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin;
        [self.lblTags setTextColor:merunRed];
        [self.lblTags setBackgroundColor:[UIColor clearColor]];
        [self.lblTags setTextAlignment:NSTextAlignmentCenter];
        [self.lblTags setFont:[UIFont systemFontOfSize:15]];
        
        NSString * strTags = @"";
        if ([dicDetails valueForKey:@"tags"])
        {
            if (![[dicDetails valueForKey:@"tags"] isEqual:[NSNull null]])
            {
                NSArray * arrtags = [dicDetails valueForKey:@"tags"];
                if ([arrtags count]>0){
                   // NSArray * tmpARr = [arrtags valueForKey:@"tags"];
                    strTags = [arrtags componentsJoinedByString:@""];
                }
                self.lblTags.text = strTags;
            }
        }
        [self.mainBGView addSubview:self.lblTags];
        
        btnTap = [[UIButton alloc]initWithFrame:CGRectMake(0,0 , frame.size.width, frame.size.height)];
        [btnTap setBackgroundColor:[UIColor clearColor]];
        [self addSubview:btnTap];
        
    }
    return self;
}


@end
