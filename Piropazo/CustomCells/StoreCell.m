//
//  StoreCell.m
//  Piropazo
//
//  Created by Lubhna Shirvastava on 20/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import "StoreCell.h"

@implementation StoreCell
@synthesize
imgFlowrIcon,
imgCrownIcon,
imgMulitipleIcon,
imgAddIcon,lbseperator;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    
    return self;
}
-(void)setup {
    
    self.contentView.backgroundColor = [UIColor redColor];
    
   
    imgFlowrIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 23, 36)];
    imgFlowrIcon.image = [UIImage imageNamed:@"Store_flower_icon.png"];
    [self.contentView addSubview:imgFlowrIcon];
    
    lbseperator = [[UILabel alloc]initWithFrame:CGRectMake(0,self.contentView.frame.size.height-0.5, self.contentView.frame.size.width, 0.5)];
    lbseperator.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lbseperator];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
