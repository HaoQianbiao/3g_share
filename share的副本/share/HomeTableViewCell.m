//
//  HomeTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/26.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "FirstViewController.h"
#import "SearchViewController.h"


@interface HomeTableViewCell()<UIScrollViewDelegate>

@end
@implementation HomeTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 415, 230)];
    _scrollView.contentSize = CGSizeMake(390 * 3, 225);
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    _scrollView.userInteractionEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentOffset = CGPointMake(390, 0);
    _imagesArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i ++) {
        [_imagesArray addObject: [UIImage imageNamed:[[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/main_img%d.png",i+1]]];
    }
    self.index = 0;
    _leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 415, 230)];
    [_leftView setImage:[_imagesArray objectAtIndex:3]];
    [_scrollView addSubview:_leftView];
    
    _middleView = [[UIImageView alloc] initWithFrame:CGRectMake(415, 0, 415, 230)];
    [_middleView setImage:[_imagesArray objectAtIndex:0]];
    [_scrollView addSubview:_middleView];
    
    _rightView = [[UIImageView alloc] initWithFrame:CGRectMake(2 * 415, 0, 415, 230)];
    [_rightView setImage:[_imagesArray objectAtIndex:1]];
    [_scrollView addSubview:_rightView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(390 / 2 - 40, 210, 40, 20)];
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self timeRun];
    
    
    _shareButtonBigArray = [[NSMutableArray alloc] init];
    
    _detailedArray = [[NSMutableArray alloc] initWithObjects:@"假日",@"share小白", @"原创-插画-练习习作", @"15分钟前", @"国外画册欣赏", @"share小王", @"平面设计-画册设计", @"16分钟前", @"collection扁平设计", @"share小吕", @"平面设计-海报设计", @"17分钟前", @"板式管理术", @"share小王", @"平面设计-样式设计", @"18分钟前", nil];

    for (int i = 0; i < 4; i++) {
        _shareButtonBig = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 420, 180)];
        _shareButtonBig.adjustsImageWhenHighlighted = NO;
        [_shareButtonBig addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
        _shareButtonImage = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 220, 180)];
        _listImage = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/list_img%d.png", i + 1];
        [_shareButtonImage setImage:[UIImage imageNamed:_listImage] forState:UIControlStateNormal];
        _shareButtonImage.adjustsImageWhenHighlighted = NO;
        [_shareButtonImage addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
        _shareButtonText = [[UIButton alloc] initWithFrame:CGRectMake(230, 0, 180, 60)];
        [_shareButtonText setTitle:[_detailedArray objectAtIndex:4 * i] forState:UIControlStateNormal];
        [_shareButtonText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _shareButtonText.titleLabel.font = [UIFont systemFontOfSize:20];
        _shareButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_shareButtonText addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
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
        [_thumbsupButton addTarget:self action:@selector(pressThumbsup:) forControlEvents:UIControlEventTouchUpInside];
        [_thumbsupButton setTitle:@"102" forState:UIControlStateNormal];
        [_thumbsupButton setTitle:@"103" forState:UIControlStateSelected];
        _thumbsupButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_thumbsupButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
        [_thumbsupButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 15) ];
        _thumbsupButton.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, -20) ;
        
            _watchButton = [[UIButton alloc] initWithFrame:CGRectMake(285, 150, 50, 30)];
        [_watchButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_guanzhu.png"] forState:UIControlStateNormal];
        [_watchButton setTitle:@"26" forState:UIControlStateNormal];
        _watchButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_watchButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
        [_watchButton setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 10) ];
        _watchButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, -30) ;
        
        _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(355, 150, 50, 30)];
        [_shareButton setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button_share.png"] forState:UIControlStateNormal];
        [_shareButton setTitle:@"20" forState:UIControlStateNormal];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
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
    if ([reuseIdentifier isEqualToString:@"0"]) {
        [self.contentView addSubview:_scrollView];
        [self.contentView addSubview:_pageControl];
    } else if ([reuseIdentifier isEqualToString:@"1"]) {
        [self.contentView addSubview:[_shareButtonBigArray objectAtIndex:0]];
    } else if ([reuseIdentifier isEqualToString:@"2"]) {
        [self.contentView addSubview:[_shareButtonBigArray objectAtIndex:1]];
    } else if ([reuseIdentifier isEqualToString:@"3"]) {
        [self.contentView addSubview:[_shareButtonBigArray objectAtIndex:2]];
    } else {
        [self.contentView addSubview:[_shareButtonBigArray objectAtIndex:3]];
    }
    return self;
    
}

-(void) timeRun
{
    _timer = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(slideImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}


-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int direction = scrollView.contentOffset.x/390;
    if (direction == 0) {
        //向左
        if (_index == 0) {
            _index = 3;
        }else{
            _index--;
        }
    }else{
        //向右
        if (_index == 3) {
            _index = 0;
        }else{
            _index++;
        }
    }
    _pageControl.currentPage = _index;
    NSArray *array = [NSArray arrayWithArray:[self getImageToShowByIndex:_index]];
    [_leftView setImage: [array objectAtIndex:0]];
    [_middleView setImage:[array objectAtIndex:1]];
    [_rightView setImage:[array objectAtIndex:2]];
    //将偏移值移回中间
    scrollView.contentOffset = CGPointMake(415, 0);
    
}

-(NSMutableArray*) getImageToShowByIndex:(int) index {
    NSMutableArray* imageArray = [[NSMutableArray alloc] init];
    if (index == 0) {
        [imageArray addObject:[_imagesArray objectAtIndex:3]];
        [imageArray addObject:[_imagesArray objectAtIndex:index]];
        [imageArray addObject:[_imagesArray objectAtIndex:index + 1]];
    } else if (index == 3) {
        [imageArray addObject:[_imagesArray objectAtIndex:index - 1]];
        [imageArray addObject:[_imagesArray objectAtIndex:index]];
        [imageArray addObject:[_imagesArray objectAtIndex:0]];
    } else {
        [imageArray addObject:[_imagesArray objectAtIndex:index - 1]];
        [imageArray addObject:[_imagesArray objectAtIndex:index]];
        [imageArray addObject:[_imagesArray objectAtIndex:index + 1]];
    }
    return imageArray;
}



-(void)slideImage{
    //自动滚动一直往右滚
    if (_index == 3) {
        _index = 0;
    }else{
        _index++;
    }
    _pageControl.currentPage = _index;
    
    NSArray *array = [NSArray arrayWithArray:[self getImageToShowByIndex:_index]];
    [_leftView setImage: [array objectAtIndex:0]];
    [_middleView setImage:[array objectAtIndex:1]];
    [_rightView setImage:[array objectAtIndex:2]];
    _scrollView.contentOffset = CGPointMake(415, 0);
}
//获取该cell的父视图
- (UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
-(void) press {
    FirstViewController* firstViewController = [[FirstViewController alloc] init];
    [[self viewController].navigationController pushViewController:firstViewController animated:YES];
    
}

-(void) pressThumbsup:(UIButton*) button {
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}
@end
