//
//  PersonMessageViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonMessageViewController : UIViewController
< UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, copy) NSArray* nameArray;
@property (nonatomic, copy) NSArray* imageNameArray;
@end

NS_ASSUME_NONNULL_END
