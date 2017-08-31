//
//  ChatMessageCell.m
//  Piropazo
//
//  Created by Lubhna Shirvastava on 22/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import "ChatMessageCell.h"

@implementation ChatMessageCell
@synthesize lblMessage,viewMessagePopUp,imgUser,imgBorder,imgOtherUser,imgOtherUserBorder,btnUserProfile,btnOtherUserProfile;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        imgBorder = [[AsyncImageView alloc] init];
        [imgBorder setContentMode:UIViewContentModeScaleAspectFill];
        imgBorder.clipsToBounds = YES;
        imgBorder.backgroundColor = [UIColor clearColor];
//        imgBorder.layer.cornerRadius = 15;
        imgBorder.hidden = YES;
        imgBorder.userInteractionEnabled = YES;
        imgBorder.layer.masksToBounds = NO;
        imgBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
        imgBorder.layer.shadowRadius = 6.0;
        imgBorder.layer.shadowOpacity = 0.4;
        [self.contentView addSubview:imgBorder];
        
        imgUser = [[AsyncImageView alloc] init];
        [imgUser setContentMode:UIViewContentModeScaleAspectFill];
        imgUser.clipsToBounds = YES;
        imgUser.hidden = YES;
        imgUser.userInteractionEnabled = YES;
        imgUser.image = [UIImage imageNamed:@"male_avtar.png"];
        imgUser.backgroundColor = [UIColor clearColor];
//        imgUser.layer.cornerRadius = 14;
        [self.contentView addSubview:imgUser];
        
        imgOtherUserBorder = [[AsyncImageView alloc] init];
        [imgOtherUserBorder setContentMode:UIViewContentModeScaleAspectFill];
        imgOtherUserBorder.clipsToBounds = YES;
        imgOtherUserBorder.backgroundColor = [UIColor clearColor];
        imgOtherUserBorder.layer.cornerRadius = 15;
        imgOtherUserBorder.hidden = YES;
        imgOtherUserBorder.layer.masksToBounds = NO;
        imgOtherUserBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
        imgOtherUserBorder.layer.shadowRadius = 6.0;
        imgOtherUserBorder.layer.shadowOpacity = 0.4;
        [self.contentView addSubview:imgOtherUserBorder];
        
        imgOtherUser = [[AsyncImageView alloc] init];
        [imgOtherUser setContentMode:UIViewContentModeScaleAspectFill];
        imgOtherUser.clipsToBounds = YES;
        imgOtherUser.hidden = YES;
        imgOtherUser.backgroundColor = [UIColor clearColor];
        imgOtherUser.layer.cornerRadius = 14;
        [self.contentView addSubview:imgOtherUser];

        btnUserProfile = [UIButton buttonWithType:UIButtonTypeCustom];
        btnUserProfile.frame = imgBorder.frame;
        [self.contentView addSubview:btnUserProfile];
        
        btnOtherUserProfile = [UIButton buttonWithType:UIButtonTypeCustom];
        btnOtherUserProfile.frame = imgOtherUserBorder.frame;
        [self.contentView addSubview:btnOtherUserProfile];
                
        viewMessagePopUp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 220, 35)];
        viewMessagePopUp.backgroundColor = [UIColor whiteColor];
        viewMessagePopUp.layer.cornerRadius = 5;;
        [self.contentView addSubview:viewMessagePopUp];
        // *** Set masks bounds to NO to display shadow visible ***
        viewMessagePopUp.layer.masksToBounds = NO;
        // *** Set light gray color as shown in sample ***
        viewMessagePopUp.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        // *** *** Use following to add Shadow top, left ***
//        viewMessagePopUp.layer.shadowOffset = CGSizeMake(-5.0f, -5.0f);
        
        // *** Use following to add Shadow bottom, right ***
        //self.avatarImageView.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        // *** Use following to add Shadow top, left, bottom, right ***
         viewMessagePopUp.layer.shadowOffset = CGSizeZero;
         viewMessagePopUp.layer.shadowRadius = 3.0f;
        
        // *** Set shadowOpacity to full (1) ***
        viewMessagePopUp.layer.shadowOpacity = 1.0f;
        [viewMessagePopUp setHidden:NO];
        
        lblMessage = [[UILabel alloc] init];
        [lblMessage setTextColor:[UIColor blackColor]];
        [lblMessage setBackgroundColor:[UIColor clearColor]];
        [lblMessage setTextAlignment:NSTextAlignmentLeft];
        [lblMessage setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [lblMessage setNumberOfLines:0];
        [self.contentView addSubview:lblMessage];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
