//
//  ArticleViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleViewController : UIViewController
<UIScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UITableView* tableViewFirst;
@property (nonatomic, strong) UITableView* tableViewSecond;
@property (nonatomic, strong) UITableView* tableViewThird;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, strong) UISegmentedControl* segmentControl;
@end

NS_ASSUME_NONNULL_END
