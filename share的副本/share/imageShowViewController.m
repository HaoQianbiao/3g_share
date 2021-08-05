//
//  imageShowViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/30.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "imageShowViewController.h"

@interface imageShowViewController ()

@end

@implementation imageShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressFinsh)];
    self.navigationItem.rightBarButtonItem = buttonItem;
    buttonItem.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, 30)];
    label.backgroundColor = [UIColor grayColor];
    label.text = @" 最近照片▽";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15];
    label.layer.borderWidth = 1;
    [label.layer setMasksToBounds:YES];
    [label.layer setCornerRadius:10];
    self.navigationItem.titleView = label;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    _scrollView.userInteractionEnabled = YES;
    _maxTag = 101;
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 4; j++) {
            NSString* str = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/照片墙/%d_%d.jpeg", i + 1, j + 1 ];
            UIImage* image = [UIImage imageNamed:str];
            _button = [[UIButton alloc] initWithFrame:CGRectMake(j * 140 + 10, i * 140 + 10, 120, 120)];
            [_button setImage:image forState:UIControlStateNormal];
            _button.tag = 101 + j + 3 * i;
            [_button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
            _button.selected = NO;
            [_scrollView addSubview:_button];
        }
    }
    [self.view addSubview:_scrollView];
    
}


-(void) press:(UIButton*)buttonLoad {

    if (buttonLoad.selected == YES) {
        buttonLoad.selected = NO;
        _imageTag = [[UIImageView alloc] initWithFrame:CGRectMake(95, 0, 30, 30)];
        [_imageTag setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/my_button_pressed.png"]];
        [buttonLoad addSubview:_imageTag];
        if (buttonLoad.tag >= _maxTag) {
            _maxTag = buttonLoad.tag;
            _strButton = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/网易云音乐/头像/%ld_%ld.jpeg", (buttonLoad.tag - 101) / 3 + 1, (buttonLoad.tag - 101) % 3 + 1];
        }
        _number++;
    } else {
        buttonLoad.selected = YES;
    }
}


-(void) pressFinsh {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否上传" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIActionSheetStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler: ^(UIAlertAction * _Nonnull action) {
        [self.delegate receiveName:self->_strButton];
        [self.delegate receiveNumber:self->_number];
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alert animated:true completion:nil];
    
}


@end
