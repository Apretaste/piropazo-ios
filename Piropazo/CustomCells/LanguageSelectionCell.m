//
//  LanguageSelectionCell.m
//  DatingApp
//
//  Created by Lubhna Shirvastava on 16/01/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "LanguageSelectionCell.h"

@implementation LanguageSelectionCell
@synthesize lblLangauge,imgProfile;

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
    
    int xx = 10;
    
    imgProfile = [[AsyncImageView alloc]initWithFrame:CGRectMake(xx, (40/2)-(15/2), 15, 15)];
    imgProfile.backgroundColor = darkGayColor;
    [self.contentView addSubview:imgProfile];
    
    xx = xx+15+10;
    
    lblLangauge = [[UILabel alloc]initWithFrame:CGRectMake(xx, (40/2)-(30/2), 200, 30)];
    lblLangauge.textColor = darkGayColor;
    lblLangauge.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:lblLangauge];
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
