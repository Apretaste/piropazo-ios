//
//  ChatVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatMessageCell.h"
#import "UserDetailVC.h"
@interface ChatVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIScrollViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,URLManagerDelegate>
{
    UIImageView * navview;
    UIImageView * imgBack;
    UIView * viewTransperent;
    UIActivityIndicatorView * placeActivityIndicator;
    
    UIView * containerView;
    UIButton * btnSend;
    UITextView *textView;
    UITextView *tempTextView;
    
    UITableView * tblContent;
    
    NSInteger currentKeyBoardHight;
        
    UIImageView * imgBorderFirstTime;
    UIImageView * imgProfileFirstTime;
    UILabel * lblMessageFirstTime;
    UIButton * btnFirstTime;
    
    NSMutableArray * arrayGetMessages;
    
    NSTimer * timerLoadChatContinuosly;
    
    AppDelegate * appDelegate;
    
    BOOL FromPushnotification;
    
    BOOL isfromResponse;;
    
    BOOL TextStartChange;


}
@property(nonatomic,strong)NSMutableDictionary * dicUserdetails;
@property(nonatomic,strong)NSString * last_inseted_chat_id;
@property(nonatomic,strong)NSString * isFromChat;
@property(nonatomic,strong)NSString * StrNameOtherUser;
@property(nonatomic,strong)NSMutableDictionary * dicOtherUserProfile;



@end
