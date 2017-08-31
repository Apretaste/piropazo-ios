//
//  ChatMessageCell.h
//  Piropazo
//
//  Created by Lubhna Shirvastava on 22/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatMessageCell : UITableViewCell
{
    
}
@property(nonatomic,strong)UILabel * lblMessage;
@property(nonatomic,strong)UIView * viewMessagePopUp;

@property(nonatomic,strong)AsyncImageView * imgBorder;
@property(nonatomic,strong)AsyncImageView * imgUser;

@property(nonatomic,strong)AsyncImageView * imgOtherUserBorder;
@property(nonatomic,strong)AsyncImageView * imgOtherUser;

@property(nonatomic,strong)UIButton * btnOtherUserProfile;
@property(nonatomic,strong)UIButton * btnUserProfile;
@end
