//
//  SettingViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, copy) NSArray* nameArray;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIAlertController* alertView;
@end

NS_ASSUME_NONNULL_END
