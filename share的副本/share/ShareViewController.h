//
//  ShareViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/30.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageShowViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShareViewController : UIViewController
<imageShowViewControllerDelegate,
UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, assign) int imageNumber;
@property (nonatomic, strong) NSString* imageName;
@property (nonatomic, strong) UIButton* buttonHead;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* nameArray;
@property (nonatomic, strong) UIButton* button;
@property BOOL selected;
@end

NS_ASSUME_NONNULL_END
