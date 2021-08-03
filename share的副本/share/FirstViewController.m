//
//  FirstViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/26.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/background_main.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"SHARE";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/back_img.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    _scrollView.userInteractionEnabled = YES;
    _scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = YES;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_scrollView];
    
    
    _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    _cellView.layer.borderWidth = 1;
    _cellView.layer.borderColor = [[UIColor lightGrayColor] CGColor];;
    
    _headImageButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    [_headImageButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_head.png"] forState:UIControlStateNormal];
    _detailedLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 60, 40)];
    _detailedLabelOne.text = @"假日";
    _detailedLabelOne.font = [UIFont systemFontOfSize:25];
    _detailedLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 40)];
    _detailedLabelTwo.text = @"share小白";
    _detailedLabelTwo.font = [UIFont systemFontOfSize:18];
    _detailedLabelThree = [[UILabel alloc] initWithFrame:CGRectMake(340, 10, 100, 40)];
    _detailedLabelThree.text = @"15分钟前";
    _detailedLabelThree.font = [UIFont systemFontOfSize:15];
    _thumbsupButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 60, 20, 20)];
    [_thumbsupButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_zan.png"] forState:UIControlStateNormal];
    _thumbsupLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 50, 30, 40)];
    _thumbsupLabel.text = @"102";
    _thumbsupLabel.font = [UIFont systemFontOfSize:13];
    _thumbsupLabel.textColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    
    _watchButton = [[UIButton alloc] initWithFrame:CGRectMake(285, 60, 30, 20)];
    [_watchButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_guanzhu.png"] forState:UIControlStateNormal];
    _watchLabel = [[UILabel alloc] initWithFrame:CGRectMake(325, 50, 30, 40)];
    _watchLabel.text = @"26";
    _watchLabel.font = [UIFont systemFontOfSize:13];
    _watchLabel.textColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    
    _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(355, 60, 20, 20)];
    [_shareButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_share.png"] forState:UIControlStateNormal];
    _shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(385, 50, 30, 40)];
    _shareLabel.text = @"20";
    _shareLabel.font = [UIFont systemFontOfSize:13];
    _shareLabel.textColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    [_cellView addSubview:_headImageButton];
    [_cellView addSubview:_detailedLabelOne];
    [_cellView addSubview:_detailedLabelTwo];
    [_cellView addSubview:_detailedLabelThree];
    [_cellView addSubview:_thumbsupButton];
    [_cellView addSubview:_thumbsupLabel];
    [_cellView addSubview:_watchButton];
    [_cellView addSubview:_watchLabel];
    [_cellView addSubview:_shareButton];
    [_cellView addSubview:_shareLabel];
    [_scrollView addSubview:_cellView];
    
    _detailedLabelFour = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 260, 30) ];
    _detailedLabelFour.text = @"多希望列车能把我带到有你的城市";
    _detailedLabelFour.font = [UIFont systemFontOfSize:16];
    _detailedLabelFour.textColor = [UIColor blackColor];
    [_scrollView addSubview:_detailedLabelFour];
    
    UIImageView* imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(10, 115, 395, 250)];
    [imageViewOne setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_img1.png"]];
    [_scrollView addSubview:imageViewOne];
    
    UIImageView* imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 370, 395, 250)];
    [imageViewTwo setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_img2.png"]];
    [_scrollView addSubview:imageViewTwo];
    UIImageView* imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(85, 625, 240, 350)];
    [imageViewThree setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_img3.png"]];
    [_scrollView addSubview:imageViewThree];
    
    UIImageView* imageViewFour = [[UIImageView alloc] initWithFrame:CGRectMake(10, 980, 390, 250)];
    [imageViewFour setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_img4.png"]];
    [_scrollView addSubview:imageViewFour];
    
    UIImageView* imageViewFive = [[UIImageView alloc] initWithFrame:CGRectMake(85, 1235, 250, 350)];
    [imageViewFive setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_img5.png"]];
    [_scrollView addSubview:imageViewFive];
    
}

@end
