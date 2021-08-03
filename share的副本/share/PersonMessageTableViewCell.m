//
//  PersonMessageTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/27.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PersonMessageTableViewCell.h"

@implementation PersonMessageTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 415, 130)];
    
    UIImageView* imageHeadView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_head.png"]];
    imageHeadView.frame = CGRectMake(10, 10, 110, 110);
    [_view addSubview:imageHeadView];
    
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 10, 150, 30)];
    _headLabel.text = @"share小白";
    _headLabel.font = [UIFont systemFontOfSize:20];
    [_view addSubview:_headLabel];
    
    _detailedLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, 150, 20)];
    _detailedLabel.font = [UIFont systemFontOfSize:13];
    _detailedLabel.text = @"数媒/设计爱好者";
    [_view addSubview:_detailedLabel];
    
    _personalSignatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 300, 30)];
    _personalSignatureLabel.font = [UIFont systemFontOfSize:16];
    _personalSignatureLabel.text = @"开心了就笑，不开心了就过会儿再笑";
    [_view addSubview:_personalSignatureLabel];
    
    _upLoadButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 95, 50, 25)];
    [_upLoadButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img1.png"] forState:UIControlStateNormal];
    [_upLoadButton setTitle:@"15" forState:UIControlStateNormal];
    _upLoadButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_upLoadButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    [_upLoadButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
    _upLoadButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, -25) ;
    [_view addSubview:_upLoadButton];
    
    _thumbsupButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 95, 50, 25)];
    [_thumbsupButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_zan.png"] forState:UIControlStateNormal];
    [_thumbsupButton setTitle:@"120" forState:UIControlStateNormal];
    _thumbsupButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_thumbsupButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    [_thumbsupButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
    _thumbsupButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, -25) ;
    [_view addSubview:_thumbsupButton];
    
    _watchButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 95, 50, 25)];
    [_watchButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_guanzhu.png"] forState:UIControlStateNormal];
    [_watchButton setTitle:@"80" forState:UIControlStateNormal];
    _watchButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_watchButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    [_watchButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
    _watchButton.titleEdgeInsets = UIEdgeInsetsMake(0, -35, 0, -25) ;
    [_view addSubview:_watchButton];

    
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img3.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    
    if([reuseIdentifier isEqualToString:@"0"]) {
        [self.contentView addSubview:_view];
        return self;
    } else {
        self.accessoryView = imageView;
        return self;
    }
}



@end
