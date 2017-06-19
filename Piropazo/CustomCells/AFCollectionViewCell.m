//
//  AFCollectionViewCell.m
//  UICollectionViewFlowLayoutExample
//
//  Created by Ash Furrow on 2013-02-05.
//  Copyright (c) 2013 Ash Furrow. All rights reserved.
//

#import "AFCollectionViewCell.h"

@interface AFCollectionViewCell ()

@end

@implementation AFCollectionViewCell
@synthesize imgBorderUser,imgBorderOtherUser,imgplusicon,imageFlower,imageCancel,imgProfileUserlike,imgProfileOtherUserlike,imgBorderUserlike,imgBorderOtherUserlike,imgProfileUser,imgProfileOtherUser,imageAccepet,imageCahticon,btnOtheruser,btnCancel,btnFlower,btnAccepet,btnCahticon;
- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    int yy = 5;
    
    self.lbldate = [[UILabel alloc] initWithFrame:CGRectMake(0, yy,self.contentView.frame.size.width, 15)];
    self.lbldate.textColor = darkGayColor;
    self.lbldate.font =[UIFont boldSystemFontOfSize:14.0];
    self.lbldate.textAlignment=NSTextAlignmentCenter;
    self.lbldate.text = @"7 days to answer";
    [self.contentView addSubview:self.lbldate];
    
    yy = yy + self.lbldate.frame.size.height+10;
    
    imgBorderUserlike = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.origin.x+5, yy, self.contentView.frame.size.width/2, self.contentView.frame.size.width/2)];
    imgBorderUserlike.layer.cornerRadius = (self.contentView.frame.size.width/2)/2;
//    imgBorderUserlike.backgroundColor = [UIColor redColor];
    imgBorderUserlike.hidden = YES;
    imgBorderUserlike.layer.masksToBounds = NO;
    imgBorderUserlike.userInteractionEnabled = YES;
    imgBorderUserlike.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorderUserlike.layer.shadowRadius = 6.0;
    imgBorderUserlike.layer.shadowOpacity = 0.4;
    [self.contentView addSubview:imgBorderUserlike];
    
    imgProfileUserlike = [[UIImageView alloc]initWithFrame:CGRectMake((self.contentView.frame.origin.x)+7, yy+2, (self.contentView.frame.size.width/2)-3, (self.contentView.frame.size.width/2)-4)];
    imgProfileUserlike.layer.cornerRadius = (imgProfileUserlike.frame.size.width)/2;
//    imgProfileUserlike.backgroundColor = [UIColor whiteColor];
    imgProfileUserlike.image = [UIImage imageNamed:@"male_avtar"];
    imgProfileUserlike.clipsToBounds=YES;
    imgProfileUserlike.hidden = YES;
    imgBorderUserlike.userInteractionEnabled = YES;
    [imgProfileUserlike setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:imgProfileUserlike];
    
    imgBorderOtherUserlike = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgBorderUserlike.frame.origin.x+self.imgBorderUserlike.frame.size.width-10, yy, self.contentView.frame.size.width/2,  self.contentView.frame.size.width/2)];
    imgBorderOtherUserlike.layer.cornerRadius = (self.contentView.frame.size.width/2)/2;
    imgBorderOtherUserlike.hidden = YES;
    imgBorderOtherUserlike.layer.masksToBounds = NO;
    imgBorderOtherUserlike.userInteractionEnabled = YES;
    imgBorderOtherUserlike.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorderOtherUserlike.layer.shadowRadius = 6.0;
    imgBorderOtherUserlike.layer.shadowOpacity = 0.4;
//    imgBorderOtherUser.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:imgBorderOtherUserlike];
    
    imgProfileOtherUserlike = [[UIImageView alloc]initWithFrame:CGRectMake(self.imgBorderUserlike.frame.origin.x+self.imgBorderUserlike.frame.size.width-8, yy+2, (self.contentView.frame.size.width/2)-4,  (self.contentView.frame.size.width/2)-4)];
    imgProfileOtherUserlike.layer.cornerRadius = (imgProfileOtherUserlike.frame.size.width)/2;
//    imgBorderOtherUserlike.backgroundColor = [UIColor whiteColor];
    imgProfileOtherUserlike.clipsToBounds=YES;
    imgProfileOtherUserlike.hidden = YES;
    imgProfileOtherUserlike.userInteractionEnabled = YES;
    [imgProfileOtherUserlike setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:imgProfileOtherUserlike];
   
//
    imgBorderOtherUser = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-self.contentView.frame.size.width/2-5, yy, self.contentView.frame.size.width/2,  self.contentView.frame.size.width/2)];
    imgBorderOtherUser.layer.cornerRadius = (self.contentView.frame.size.width/2)/2;
    imgBorderOtherUser.hidden = YES;
    imgBorderOtherUser.layer.masksToBounds = NO;
    imgBorderOtherUser.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorderOtherUser.layer.shadowRadius = 6.0;
    imgBorderOtherUser.layer.shadowOpacity = 0.4;
    [self.contentView addSubview:imgBorderOtherUser];
    
    imgProfileOtherUser = [[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-self.contentView.frame.size.width/2-3, yy+2, (self.contentView.frame.size.width/2)-4, (self.contentView.frame.size.width/2)-4)];
    imgProfileOtherUser.layer.cornerRadius = (imgProfileOtherUser.frame.size.width)/2;
    //    imgBorderOtherUserlike.backgroundColor = [UIColor whiteColor];
    imgProfileOtherUser.hidden = YES;
    imgProfileOtherUser.clipsToBounds=YES;
    imgBorderOtherUser.userInteractionEnabled = YES;
    [imgProfileOtherUser setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:imgProfileOtherUser];
    
    imgBorderUser = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgBorderOtherUser.frame.origin.x-self.imgBorderOtherUser.frame.size.width+10, yy, self.contentView.frame.size.width/2,  self.contentView.frame.size.width/2)];
    imgBorderUser.layer.cornerRadius = (self.contentView.frame.size.width/2)/2;
//    imgBorderUser.backgroundColor = [UIColor redColor];
    imgBorderUser.layer.masksToBounds = NO;
    imgBorderUser.hidden = YES;
    imgBorderUser.userInteractionEnabled = YES;
    imgBorderUser.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorderUser.layer.shadowRadius = 6.0;
    imgBorderUser.layer.shadowOpacity = 0.4;
    [self.contentView addSubview:imgBorderUser];
    
    imgProfileUser = [[UIImageView alloc]initWithFrame:CGRectMake(self.imgBorderOtherUser.frame.origin.x-self.imgBorderOtherUser.frame.size.width+12, yy+2, (self.contentView.frame.size.width/2)-3, (self.contentView.frame.size.width/2)-4)];
    imgProfileUser.layer.cornerRadius = (imgProfileUser.frame.size.width)/2;
//        imgProfileUser.backgroundColor = [UIColor whiteColor];
    imgProfileUser.image = [UIImage imageNamed:@"male_avtar"];
    imgProfileUser.clipsToBounds=YES;
    imgProfileUser.hidden = YES;
    imgProfileUser.userInteractionEnabled = YES;
    [imgProfileUser setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:imgProfileUser];
    
    _btnuser = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnuser.frame = imgBorderUserlike.frame;
    [self.contentView addSubview:_btnuser];
    
    btnOtheruser = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOtheruser.frame = imgBorderOtherUserlike.frame;
    [self.contentView addSubview:btnOtheruser];
//
//    imgProfileOtherUser = [[AsyncImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-self.contentView.frame.size.width/2, yy+1, self.contentView.frame.size.width/2-10, self.contentView.frame.size.width/2-2)];
//    //        imgProfileUser.clipsToBounds=YES;
//    imgProfileOtherUser.layer.cornerRadius = imgProfileOtherUser.frame.size.width/2;
//    [imgProfileOtherUser setContentMode:UIViewContentModeScaleAspectFit];
//    imgProfileOtherUser.backgroundColor = [UIColor whiteColor];
//    [self.contentView  addSubview:imgProfileOtherUser];
////
////    imgProfileUser = [[AsyncImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.origin.x+10, yy+5, (self.contentView.frame.size.width/2)-10, (self.contentView.frame.size.width/2)-10)];
////    imgProfileUser.clipsToBounds=YES;
////    imgProfileUser.layer.cornerRadius = imgProfileUser.frame.size.width/2;
////    [imgProfileUser setContentMode:UIViewContentModeScaleAspectFill];
////    imgProfileUser.backgroundColor = [UIColor whiteColor];
//    
//        imgProfileUser = [[AsyncImageView alloc]initWithFrame:CGRectMake(imgBorderUser.frame.origin.x+3, yy+3, imgBorderUser.frame.size.width-6, imgBorderUser.frame.size.height-6)];
////        imgProfileUser.clipsToBounds=YES;
//        imgProfileUser.layer.cornerRadius = imgProfileUser.frame.size.width/2;
//        [imgProfileUser setContentMode:UIViewContentModeScaleAspectFit];
//        imgProfileUser.backgroundColor = [UIColor whiteColor];
//        [imgBorderUser addSubview:imgProfileUser];
    
//    imgplusicon = [[UIImageView alloc] initWithFrame:CGRectMake(imgBorderOtherUser.frame.origin.x-imgBorderOtherUser.frame.size.width-8, (imgBorderOtherUser.frame.size.height/2)-(32/2), 32,32)];
//    imgplusicon.layer.cornerRadius = 32/2;
//    imgplusicon.image = [UIImage imageNamed:@"plus_icon_Matches.png"];
//    [imgBorderOtherUser addSubview:imgplusicon];
    
    imgplusicon = [[UIImageView alloc]initWithFrame:CGRectMake(imgProfileUser.frame.size.width-8, (imgProfileUser.frame.size.height/2)+7, 32, 32)];
        imgplusicon.layer.cornerRadius = 32/2;
    imgplusicon.hidden = YES;
        imgplusicon.image = [UIImage imageNamed:@"plus_icon_Matches.png"];
        [self.contentView addSubview:imgplusicon];


    yy = yy + self.imgBorderUser.frame.size.height+4+3;

    imageFlower = [[UIImageView alloc] initWithFrame:CGRectMake((imgBorderUser.frame.size.width/2)-(23/2)+15, yy, 23,37)];
    imageFlower.image = [UIImage imageNamed:@"Flower-button.png"];
    imageFlower.userInteractionEnabled = YES;
    imageFlower.hidden = NO;
    [self.contentView addSubview:imageFlower];
    
    btnFlower = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFlower.frame = imageFlower.frame;
    btnFlower.hidden = NO;
    btnFlower.userInteractionEnabled = YES;
    [self.contentView addSubview:btnFlower];
    
    imageAccepet = [[UIImageView alloc] initWithFrame:CGRectMake((imgBorderUser.frame.size.width/2)-(26/2)+12, yy+2, 26,24)];
    imageAccepet.image = [UIImage imageNamed:@"accept_People.png"];
    imageAccepet.hidden = YES;
    imageAccepet.userInteractionEnabled = YES;
    [self.contentView addSubview:imageAccepet];
    
    btnAccepet = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAccepet.frame = imageAccepet.frame;
    btnAccepet.hidden = YES;
    btnAccepet.userInteractionEnabled = YES;
    [self.contentView addSubview:btnAccepet];
    
    
    imageCancel = [[UIImageView alloc] initWithFrame:CGRectMake((imgBorderOtherUser.frame.origin.x+ imgBorderOtherUser.frame.size.width/2)-(25/2)-5, yy+2, 25,25)];
    imageCancel.image = [UIImage imageNamed:@"cancel_People.png"];
    imageCancel.hidden = YES;
    imageCancel.userInteractionEnabled = YES;
    [self.contentView addSubview:imageCancel];
    
    btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancel.userInteractionEnabled = YES;
    btnCancel.frame = imageCancel.frame;
    btnCancel.hidden = YES;
//    btnCancel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:btnCancel];
    
    imageCahticon = [[UIImageView alloc]init];
    imageCahticon.image = [UIImage imageNamed:@"chat_btn.png"];
    [self.contentView addSubview:imageCahticon];
    
    return self;
}

@end
