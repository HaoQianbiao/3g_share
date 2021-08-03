//
//  imageShowViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/30.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol imageShowViewControllerDelegate<NSObject>
-(void) receiveName:(NSString*) name;
-(void) receiveNumber:(int) num;
@end
@interface imageShowViewController : UIViewController
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, copy) NSString* strButton;
@property (nonatomic, strong) UIImageView* imageTag;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, assign) NSInteger maxTag;
@property (nonatomic, assign) int number;
@property (nonatomic, assign) id<imageShowViewControllerDelegate>delegate;
@end

