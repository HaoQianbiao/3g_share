//
//  MyUpLoadOneTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MyUpLoadOneTableViewCell.h"

@implementation MyUpLoadOneTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray* labelArray = [[NSArray alloc] initWithObjects:@"猫咪可能也有心事吧", @"share咪咪", @"1分钟以前", @"逝去的曾经", @"share夏沫", @"5分钟以前", @"云舒霞卷", @"share紫霞", @"30分钟以前", @"爱意未曾削减", @"share晓雯", @"58分钟以前", @"暂停营业", @"share小婧", @"1小时以前",nil];
    NSMutableArray* viewArray = [[NSMutableArray alloc] init];
    
    for (int j = 0; j < 5; j++) {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 415, 150)];
        NSString* str = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/article/%d.jpeg",  (j + 6)];
        _imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
        [_imageview setImage:[UIImage imageNamed:str]];
        _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 0, 200, 60)];
        _headLabel.text = [labelArray objectAtIndex:3 * j];
        _headLabel.textColor = [UIColor blackColor];
        _headLabel.font = [UIFont systemFontOfSize:20];
        _detailedLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(210, 50, 100, 20)];
        _detailedLabelOne.text = [labelArray objectAtIndex:3 * j + 1];
        _detailedLabelOne.font = [UIFont systemFontOfSize:15];
        _detailedLabelOne.textColor = [UIColor blackColor];
        _detailedLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(210, 80, 100, 20)];
        _detailedLabelTwo.text = [labelArray objectAtIndex:3 * j + 2];
        _detailedLabelTwo.font = [UIFont systemFontOfSize:15];
        
        _thumbsupButton = [[UIButton alloc] initWithFrame:CGRectMake(210, 120, 50, 30)];
        [_thumbsupButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_zan.png"] forState:UIControlStateNormal];
        [_thumbsupButton setTitle:@"102" forState:UIControlStateNormal];
        _thumbsupButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_thumbsupButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_thumbsupButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
        _thumbsupButton.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, -20) ;
        
        _watchButton = [[UIButton alloc] initWithFrame:CGRectMake(275, 120, 50, 30)];
        [_watchButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_guanzhu.png"] forState:UIControlStateNormal];
        [_watchButton setTitle:@"26" forState:UIControlStateNormal];
        _watchButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_watchButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_watchButton setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 10) ];
        _watchButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
        
        _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(345, 120, 50, 30)];
        [_shareButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_share.png"] forState:UIControlStateNormal];
        [_shareButton setTitle:@"20" forState:UIControlStateNormal];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_shareButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
        _shareButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
        [_view addSubview:_imageview];
        [_view addSubview:_headLabel];
        [_view addSubview:_detailedLabelOne];
        [_view addSubview:_detailedLabelTwo];
        [_view addSubview:_thumbsupButton];
        [_view addSubview:_watchButton];
        [_view addSubview:_shareButton];
        [viewArray addObject:_view];
    }
    
    if ([reuseIdentifier isEqualToString:@"0"] ) {
        [self.contentView addSubview:[viewArray objectAtIndex:0]];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"1"]) {
        [self.contentView addSubview:[viewArray objectAtIndex:1]];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"2"]) {
        [self.contentView addSubview:[viewArray objectAtIndex:2]];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"3"]) {
        [self.contentView addSubview:[viewArray objectAtIndex:3]];
        return self;
    }else {
        [self.contentView addSubview:[viewArray objectAtIndex:4]];
        return self;
    }
}


@end
