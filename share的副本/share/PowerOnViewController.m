//
//  PowerOnViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/26.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PowerOnViewController.h"
#import "LoginViewController.h"
@interface PowerOnViewController ()

@end

@implementation PowerOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/login_1.jpg"];
    [self.view insertSubview:imageView atIndex:0];
}
@end
