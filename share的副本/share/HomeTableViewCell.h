//
//  HomeTableViewCell.h
//  share
//
//  Created by haoqianbiao on 2021/7/26.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell
<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property(nonatomic,strong) UIImageView *leftView;
@property(nonatomic,strong) UIImageView *middleView;
@property(nonatomic,strong) UIImageView *rightView;
@property(nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray* imagesArray;
@property (nonatomic, assign) int index;
@property(nonatomic,strong) UIButton* shareButtonBig;
@property(nonatomic,strong) UIButton* shareButtonImage;
@property(nonatomic,strong) UIButton* shareButtonText;
@property(nonatomic,strong) UILabel* detailedLabelOne;
@property(nonatomic,strong) UILabel* detailedLabelTwo;
@property(nonatomic,strong) UILabel* detailedLabelThree;
@property(nonatomic,strong) UIButton* thumbsupButton;
@property(nonatomic,strong) UIButton* watchButton;
@property(nonatomic,strong) UIButton* shareButton;
@property (nonatomic, strong) NSMutableArray* detailedArray;
@property (nonatomic, strong) NSString* listImage;
@property (nonatomic, strong) NSMutableArray* shareButtonBigArray;
@property (nonatomic, strong) NSTimer* timer;

@end

NS_ASSUME_NONNULL_END
