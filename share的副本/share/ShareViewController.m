//
//  ShareViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/30.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "ShareViewController.h"
#import "imageShowViewController.h"
#import "ShareTableViewCell.h"
@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/back_img.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    self.view.backgroundColor = [UIColor whiteColor];
    _buttonHead = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 230, 150)];
    [_buttonHead setTitle:@"选择图片" forState:UIControlStateNormal];
    [_buttonHead setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonHead.backgroundColor = [UIColor grayColor];
    [_buttonHead addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonHead];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(260, 60, 20, 20)];
    imageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/zu.png"];
    [self.view addSubview:imageView];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(290, 60, 100, 20)];
    label.text = @"陕西省. 西安市";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.layer.borderWidth = 1;
    label.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1]);
    [label.layer setMasksToBounds:YES];
    [label.layer setCornerRadius:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    [self.view addSubview:label];
    
    NSArray* classNameArray = [[NSArray alloc] initWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(j * 95 + 10, i * 40 + 200, 90, 30) ;
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:[classNameArray objectAtIndex:4 * i + j] forState:UIControlStateNormal];
            [self.view addSubview:button];
        }
    }
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 280, 380, 30)];
    _textField.font = [UIFont systemFontOfSize:15];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    _textField.placeholder = @"作品名称";
    [self.view addSubview:_textField];
    
    UITextField* textFieldOne = [[UITextField alloc] initWithFrame:CGRectMake(10, 320, 380, 100)];
    textFieldOne.borderStyle = UITextBorderStyleRoundedRect;
    textFieldOne.text = @"请添加作品说明文章内容...";
    textFieldOne.font = [UIFont systemFontOfSize:15];
    textFieldOne.layer.borderWidth = 1;
    textFieldOne.delegate = self;
    textFieldOne.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor grayColor]);
    [self.view addSubview:textFieldOne];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 430, 380, 30);
    button.backgroundColor = [UIColor colorWithRed:0.167 green:0.45 blue:0.75 alpha:1];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressToRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton* buttonSwitch = [[UIButton alloc] initWithFrame:CGRectMake(10, 490, 20, 20)];
    [buttonSwitch setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/checkbox_unchecked.png"] forState:UIControlStateNormal];
    [buttonSwitch setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/checkbox_checked.png"] forState:UIControlStateSelected];
    [buttonSwitch addTarget:self action:@selector(pressSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSwitch];
    
    UILabel* labelSwitch = [[UILabel alloc] initWithFrame:CGRectMake(40, 485, 80, 30)];
    labelSwitch.text = @"禁止下载";
    labelSwitch.font = [UIFont systemFontOfSize:18];
    labelSwitch.textColor = [UIColor blackColor];
    [self.view addSubview:labelSwitch];
    
    
    _nameArray = [[NSMutableArray alloc] initWithObjects:@"原创作品", @"设计资料", @"设计教程", @"设计师观点",nil];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(260, 90, 120, 40) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"0"];
    [self.view addSubview:_tableView];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(360, 100, 25, 25);
    [_button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/合上.png"] forState:UIControlStateNormal];
    _selected = NO;
    [_button addTarget:self action:@selector(pressCell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
}

-(void) pressToRelease {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"成功发布" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [_textField resignFirstResponder];
}

-(void) pressSwitch:(UIButton*) button {
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}


-(void) press{
    imageShowViewController* imageShow = [[imageShowViewController alloc] init];
    imageShow.delegate = self;
    [self.navigationController pushViewController:imageShow animated:YES];
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

-(void) receiveNumber:(int)num {
    
    _imageNumber = num;
    UILabel* labelImageNumber = [[UILabel alloc] initWithFrame:CGRectMake(215, 0, 15, 15)];
    labelImageNumber.text = [NSString stringWithFormat:@"%d",_imageNumber];
    labelImageNumber.textColor = [UIColor whiteColor];
    labelImageNumber.backgroundColor = [UIColor redColor];
    labelImageNumber.font = [UIFont systemFontOfSize:15];
    [_buttonHead addSubview:labelImageNumber];
    
}

-(void) receiveName:(NSString *)name {
    _imageName = name;
    [_buttonHead setImage:[UIImage imageNamed:_imageName] forState:UIControlStateNormal];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_selected == 0) {
        return 1;
    } else {
        return 4;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithString:_nameArray[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *labelStr = [NSString stringWithString:_nameArray[indexPath.row]];
    [_nameArray insertObject:labelStr atIndex:0];
    [_nameArray removeObjectAtIndex:indexPath.row + 1];
    [_tableView reloadData];
    [self pressCell];
}

-(void) pressCell {
    if (_selected == 0) {
        _selected = 1;
        _tableView.frame = CGRectMake(260, 90, 120, 160);
        [_button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/zhankai.png"] forState:UIControlStateNormal];
    } else {
        _selected = 0;
        _tableView.frame = CGRectMake(260, 90, 120, 40);
        [_button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/合上.png"] forState:UIControlStateNormal];
    }
     [_tableView reloadData];
}
@end
