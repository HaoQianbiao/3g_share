//
//  FirstViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/26.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIButton* headImageButton;
@property(nonatomic,strong) UIButton* thumbsupButton;
@property(nonatomic,strong) UIButton* watchButton;
@property(nonatomic,strong) UIButton* shareButton;
@property(nonatomic,strong) UILabel* thumbsupLabel;
@property(nonatomic,strong) UILabel* watchLabel;
@property(nonatomic,strong) UILabel* shareLabel;
@property(nonatomic,strong) UILabel* detailedLabelOne;
@property(nonatomic,strong) UILabel* detailedLabelTwo;
@property(nonatomic,strong) UILabel* detailedLabelThree;
@property(nonatomic,strong) UILabel* detailedLabelFour;
@property(nonatomic,strong) UIView* cellView;
@end

NS_ASSUME_NONNULL_END
