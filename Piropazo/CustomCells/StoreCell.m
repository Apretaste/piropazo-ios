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
imgAddIcon,lbseperator,lblItemsName,btnCost,lblSave,lblNumberone ;

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
    
    self.contentView.backgroundColor = [UIColor clearColor];
    
    int yy = 8;
    
    imgFlowrIcon = [[UIImageView alloc]initWithFrame:CGRectMake(12, yy, 23, 36)];
    imgFlowrIcon.image = [UIImage imageNamed:@"Store_flower_icon.png"];
    [self.contentView addSubview:imgFlowrIcon];
    
    imgCrownIcon = [[UIImageView alloc]initWithFrame:CGRectMake(12, yy, 52, 34)];
    imgCrownIcon.image = [UIImage imageNamed:@"store_crown_icon.png"];
    [self.contentView addSubview:imgCrownIcon];
    
    imgMulitipleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(imgCrownIcon.frame.origin.x+imgCrownIcon.frame.size.width+4, (imgCrownIcon.frame.origin.y+imgCrownIcon.frame.size.height/2)-(13/2), 13, 14)];
    imgMulitipleIcon.image = [UIImage imageNamed:@"Store_multiple_icon.png"];
    [self.contentView addSubview:imgMulitipleIcon];
    
    lblNumberone = [[UILabel alloc]initWithFrame:CGRectMake(imgMulitipleIcon.frame.origin.x+imgMulitipleIcon.frame.size.width+12, yy+2, 8, 30)];
    lblNumberone.text = @"1";
    lblNumberone.font = [UIFont systemFontOfSize:20];
    lblNumberone.textColor = [UIColor grayColor];
    [self.contentView addSubview:lblNumberone];
    
    imgAddIcon = [[UIImageView alloc]initWithFrame:CGRectMake(imgFlowrIcon.frame.origin.x+imgFlowrIcon.frame.size.width+12, (imgFlowrIcon.frame.origin.y+imgFlowrIcon.frame.size.height/2)-(16/2), 16, 16)];
    imgAddIcon.image = [UIImage imageNamed:@"Store_plus_icon.png"];
    [self.contentView addSubview:imgAddIcon];
    
    yy = yy+imgFlowrIcon.frame.size.height+8;
    
    lblItemsName = [[UILabel alloc]initWithFrame:CGRectMake(12, yy,310, 13)];
    lblItemsName.textColor = [UIColor grayColor];
    [self.contentView addSubview:lblItemsName];
    
    lbseperator = [[UILabel alloc]initWithFrame:CGRectMake(0,72-0.5,DEVICE_WIDTH, 0.5)];
    lbseperator.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lbseperator];
    
    btnCost = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCost.frame = CGRectMake(self.contentView.frame.size.width-80,(72/2)-(20/2), 60, 20);
    btnCost.backgroundColor = violetgreenColor;
    btnCost.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    btnCost.layer.cornerRadius = 3;
    [self.contentView addSubview:btnCost];
    
    lblSave = [[UILabel alloc]init];
    lblSave.textColor = [UIColor redColor];
    lblSave.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:lblSave];
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
