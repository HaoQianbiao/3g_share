//
//  SearchViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "SearchViewController.h"
#import "BigWhiteViewController.h"
#import "ShareViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/actionbar.png"] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"搜索";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/fenxiang2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(press)];
    self.navigationItem.rightBarButtonItem = buttonItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    UIImageView* userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 25, 25)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/sousuo-copy.png"];
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 380, 30)];
    [_textField setValue:[NSNumber numberWithInt:35] forKey:@"paddingLeft"];
    _textField.font = [UIFont systemFontOfSize:15];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    
    _textField.delegate = self;
    _textField.placeholder = @"        搜索 用户名 作品分类 文章";
    
    [_textField addSubview:userImageView];
    
    UIImageView* imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 75, 25)];
    imageViewOne.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/5 搜索—内容输入.jpg"];
    UIImageView* imageViewLineOne = [[UIImageView alloc] initWithFrame:CGRectMake(10, 95, self.view.bounds.size.width, 2)];
    imageViewLineOne.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/home_line.png"];
    
    NSArray* classNameArray = [[NSArray alloc] initWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    NSArray* recommandArray = [[NSArray alloc] initWithObjects:@"人气最高", @"收藏最多", @"评论最多", @"编辑精选", nil];
    NSArray* timeArray = [[NSArray alloc] initWithObjects:@"30分钟前", @"1小时前", @"1月前", @"1年前", nil];
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(j * 95 + 10, i * 40 + 105, 90, 30) ;
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:[classNameArray objectAtIndex:4 * i + j] forState:UIControlStateNormal];
            [self.view addSubview:button];
        }
    }
    
    UIImageView* imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 180, 75, 25)];
    imageViewTwo.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/5 搜索—内容输入1.jpg"];
    UIImageView* imageViewLineTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 205, self.view.bounds.size.width, 2)];
    imageViewLineTwo.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/home_line.png"];
    for (int j = 0; j < 4; j++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(j * 95 + 10, 215, 90, 30) ;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[recommandArray objectAtIndex: j] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    

    
    UIImageView* imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(10, 270, 75, 25)];
    imageViewThree.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/5 搜索—内容输入2.jpg"];
    UIImageView* imageViewLineThree = [[UIImageView alloc] initWithFrame:CGRectMake(10, 295, self.view.bounds.size.width, 2)];
    imageViewLineThree.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/home_line.png"];
    
    for (int j = 0; j < 4; j++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(j * 95 + 10, 305, 90, 30) ;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[timeArray objectAtIndex: j] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    
    
    [self.view addSubview:imageViewThree];
    [self.view addSubview:imageViewLineThree];
    [self.view addSubview:imageViewTwo];
    [self.view addSubview:imageViewLineTwo];
    [self.view addSubview:imageViewLineOne];
    [self.view addSubview:imageViewOne];
    [self.view addSubview:_textField];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if([_textField.text isEqualToString:@"大白"]) {
        BigWhiteViewController* bigWhiteController = [[BigWhiteViewController alloc] init];
        [self.navigationController pushViewController:bigWhiteController animated:YES];
    } else {
        _alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有找到您要查询的内容！" preferredStyle:UIAlertControllerStyleAlert];
        [_alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIActionSheetStyleDefault handler:nil]];
        [self presentViewController:_alertView animated:true completion:nil];
    }
    return [_textField resignFirstResponder];
}
-(void) press:(UIButton*)button {
    if (button.selected == YES) {
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.selected = NO;
    } else {
        button.tintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
        button.selected = YES;
    }
}
-(void) dismiss:(UIAlertController*) alert {
    [alert dismissViewControllerAnimated:YES completion:nil];
}

-(void) press {
    ShareViewController* shareViewController = [[ShareViewController alloc] init];
    [self.navigationController pushViewController:shareViewController animated:YES];
}
@end
