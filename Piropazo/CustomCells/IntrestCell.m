//
//  IntrestCell.m
//  Piropazo
//
//  Created by i-MaC on 07/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import "IntrestCell.h"

@implementation IntrestCell
@synthesize lblSeperator,lblintrstsadd,btnDeleteIntrset;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    
    return self;
}
-(void)setup
{
    lblintrstsadd = [[ UILabel alloc]initWithFrame:CGRectMake(5, 3, 100, 20)];
    lblintrstsadd.textColor = [UIColor blackColor];
    lblintrstsadd.text = @"Bedrooms";
    lblintrstsadd.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lblintrstsadd];
    
    lblSeperator = [[ UILabel alloc]initWithFrame:CGRectMake(5, self.contentView.frame.size.height-0.5, self.contentView.frame.size.width,0.5 )];
    lblSeperator.backgroundColor = violetgreenColor;
    [self.contentView addSubview:lblSeperator];
    
    btnDeleteIntrset = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDeleteIntrset.hidden = YES;
    [btnDeleteIntrset setImage:[UIImage imageNamed:@"cancel_People.png"] forState:UIControlStateNormal];
    btnDeleteIntrset.frame = CGRectMake(self.contentView.frame.size.width-50,(30/2)-(28/2) , 30, 28) ;
    [self.contentView addSubview:btnDeleteIntrset];
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
