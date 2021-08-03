//
//  RecommondTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "RecommondTableViewCell.h"

@implementation RecommondTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _shareButtonBigArray = [[NSMutableArray alloc] init];
    
    _detailedArray = [[NSMutableArray alloc] initWithObjects:@"匆匆那年",@"share小吕", @"原创-摄影-练习习作", @"10分钟前", @"国外画册欣赏", @"share小王", @"平面设计-画册设计", @"16分钟前", @"collection扁平设计", @"share小吕", @"平面设计-海报设计", @"17分钟前", @"字体故事", @"share小王", @"设计文章-海报设计", @"45分钟前",@"板式管理术", @"share小王", @"平面设计-样式设计", @"1小时前", nil];
    int num = [reuseIdentifier intValue];
    
    for (int i = 0; i < 5; i++) {
        _shareButtonBig = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 420, 180)];
        _shareButtonBig.adjustsImageWhenHighlighted = NO;
        _shareButtonImage = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 220, 180)];
        _listImage = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/推荐/R%d.png", i + 1];
        [_shareButtonImage setImage:[UIImage imageNamed:_listImage] forState:UIControlStateNormal];
        _shareButtonImage.adjustsImageWhenHighlighted = NO;
        _shareButtonText = [[UIButton alloc] initWithFrame:CGRectMake(230, 0, 180, 60)];
        [_shareButtonText setTitle:[_detailedArray objectAtIndex:4 * i] forState:UIControlStateNormal];
        [_shareButtonText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _shareButtonText.titleLabel.font = [UIFont systemFontOfSize:20];
        _shareButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _detailedLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(230, 50, 100, 20)];
        _detailedLabelOne.text = [_detailedArray objectAtIndex:4 * i + 1];
        _detailedLabelOne.font = [UIFont systemFontOfSize:15];
        _detailedLabelOne.textColor = [UIColor blackColor];
        _detailedLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(230, 80, 200, 20)];
        _detailedLabelTwo.text = [_detailedArray objectAtIndex:4 * i + 2];
        _detailedLabelTwo.font = [UIFont systemFontOfSize:15];
        _detailedLabelThree.textColor = [UIColor blackColor];
        _detailedLabelThree = [[UILabel alloc] initWithFrame:CGRectMake(230, 120, 100, 20)];
        _detailedLabelThree.text = [_detailedArray objectAtIndex:4 * i + 3];
        _detailedLabelThree.font = [UIFont systemFontOfSize:15];
        _detailedLabelThree.textColor = [UIColor blackColor];
        
        _thumbsupButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 150, 50, 30)];
        [_thumbsupButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_zan.png"] forState:UIControlStateNormal];
        [_thumbsupButton setTitle:@"45" forState:UIControlStateNormal];
        _thumbsupButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_thumbsupButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_thumbsupButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
        _thumbsupButton.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, -20) ;
        
        _watchButton = [[UIButton alloc] initWithFrame:CGRectMake(285, 150, 50, 30)];
        [_watchButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_guanzhu.png"] forState:UIControlStateNormal];
        [_watchButton setTitle:@"102" forState:UIControlStateNormal];
        _watchButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_watchButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_watchButton setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 10) ];
        _watchButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
        
        _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(355, 150, 50, 30)];
        [_shareButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_share.png"] forState:UIControlStateNormal];
        [_shareButton setTitle:@"20" forState:UIControlStateNormal];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_shareButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
        _shareButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
        
        [_shareButtonBig addSubview:_shareButtonImage];
        [_shareButtonBig addSubview:_shareButtonText];
        [_shareButtonBig addSubview:_detailedLabelOne];
        [_shareButtonBig addSubview:_detailedLabelTwo];
        [_shareButtonBig addSubview:_detailedLabelThree];
        [_shareButtonBig addSubview:_thumbsupButton];
        [_shareButtonBig addSubview:_shareButton];
        [_shareButtonBig addSubview:_watchButton];
        [_shareButtonBig addSubview:_thumbsupButton];
        [_shareButtonBigArray addObject:_shareButtonBig];
    }
    [self.contentView addSubview:[_shareButtonBigArray objectAtIndex:num]];
    return self;
    
}





@end
