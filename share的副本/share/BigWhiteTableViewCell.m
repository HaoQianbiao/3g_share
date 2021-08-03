//
//  BigWhiteTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "BigWhiteTableViewCell.h"

@implementation BigWhiteTableViewCell
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    int num = [reuseIdentifier intValue];
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"Icon of BAIMax", @"share小茜",@"原创-UI-icon", @"17分钟前", @"可爱的大白", @"share小美", @"原创", @"30分钟前",nil];
    NSString* str = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/大白%d.jpg", num +1];
    _imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 170, 150)];
    _imageViewOne.image = [UIImage imageNamed:str];
    _headLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 200, 60)];
    _headLabelOne.text = [nameArray objectAtIndex: num * 4];
    _headLabelOne.textColor = [UIColor blackColor];
    _headLabelOne.font = [UIFont systemFontOfSize:20];
    _detailedLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(200, 45, 100, 20)];
    _detailedLabelOne.text = [nameArray objectAtIndex: num * 4 + 1];
    _detailedLabelOne.font = [UIFont systemFontOfSize:13];
    _detailedLabelOne.textColor = [UIColor blackColor];
    _detailedLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(200, 70, 100, 20)];
    _detailedLabelTwo.text = [nameArray objectAtIndex: num * 4 + 2];
    _detailedLabelTwo.font = [UIFont systemFontOfSize:13];
    _detailedLabelThree = [[UILabel alloc] initWithFrame:CGRectMake(200, 90, 100, 20)];
    _detailedLabelThree.text = [nameArray objectAtIndex: num * 4 + 3];
    _detailedLabelThree.font = [UIFont systemFontOfSize:13];
    
    _thumbsupButton = [[UIButton alloc] initWithFrame:CGRectMake(190, 120, 50, 30)];
    [_thumbsupButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_zan.png"] forState:UIControlStateNormal];
    [_thumbsupButton setTitle:@"102" forState:UIControlStateNormal];
    _thumbsupButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_thumbsupButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_thumbsupButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
    _thumbsupButton.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, -20) ;
    
    _watchButton = [[UIButton alloc] initWithFrame:CGRectMake(255, 120, 50, 30)];
    [_watchButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_guanzhu.png"] forState:UIControlStateNormal];
    [_watchButton setTitle:@"26" forState:UIControlStateNormal];
    _watchButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_watchButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_watchButton setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 10) ];
    _watchButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
    
    _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(325, 120, 50, 30)];
    [_shareButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_share.png"] forState:UIControlStateNormal];
    [_shareButton setTitle:@"20" forState:UIControlStateNormal];
    _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_shareButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_shareButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
    _shareButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
    [_view addSubview:_imageViewOne];
    [_view addSubview:_headLabelOne];
    [_view addSubview:_detailedLabelOne];
    [_view addSubview:_detailedLabelTwo];
    [_view addSubview:_detailedLabelThree];
    [_view addSubview:_thumbsupButton];
    [_view addSubview:_watchButton];
    [_view addSubview:_shareButton];
    if ([reuseIdentifier isEqualToString:@"0"]) {
        [self.contentView addSubview:_view];
        return self;
    } else {
        [self.contentView addSubview:_view];
        return self;
    }
}

@end
