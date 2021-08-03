//
//  PassworChangeTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PassworChangeTableViewCell.h"
@interface PassworChangeTableViewCell () <UITextFieldDelegate>

@end
@implementation PassworChangeTableViewCell
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    
    
    
    
    if ([reuseIdentifier isEqualToString:@"0"]) {
        _textFieldOne = [[UITextField alloc] initWithFrame:CGRectMake(130, 10, 300, 40)];
        _textFieldOne.font = [UIFont systemFontOfSize:20];
        _textFieldOne.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldOne.delegate = self;
        _textFieldOne.borderStyle = UITextBorderStyleNone;
        _textFieldOne.secureTextEntry = YES;
        self.textLabel.text = @"旧密码";
        [self addSubview:_textFieldOne];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"1"]) {
        _textFieldTwo = [[UITextField alloc] initWithFrame:CGRectMake(130, 10, 300, 40)];
        _textFieldTwo.font = [UIFont systemFontOfSize:20];
        _textFieldTwo.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldTwo.delegate = self;
        _textFieldTwo.borderStyle = UITextBorderStyleNone;
        _textFieldTwo.secureTextEntry = YES;
        self.textLabel.text = @"新密码";
        [self addSubview:_textFieldTwo];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"2"]) {
        _textFieldThree = [[UITextField alloc] initWithFrame:CGRectMake(130, 10, 300, 40)];
        _textFieldThree.font = [UIFont systemFontOfSize:20];
        _textFieldThree.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldThree.delegate = self;
        _textFieldThree.borderStyle = UITextBorderStyleNone;
        _textFieldThree.secureTextEntry = YES;
        self.textLabel.text = @"确认密码";
        [self addSubview:_textFieldThree];
        return self;
    } else {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(180, 100, 60, 40);
        button.backgroundColor = [UIColor blackColor];
        [button setTitle:@"提交" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        return self;
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGRect adjustFrameOne = self.textLabel.frame;
    adjustFrameOne.origin.x += 20;
    self.textLabel.frame = adjustFrameOne;
}
- (UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

-(void) press {
            NSLog(@"%@   %@    %@", _textFieldOne.text, _textFieldTwo.text, _textFieldThree.text);
            NSLog(@"%d", [_textFieldThree.text isEqualToString:_textFieldTwo.text]);
    if ([_textFieldTwo.text isEqualToString:_textFieldThree.text]) {

        [_textFieldOne resignFirstResponder];
        [_textFieldThree resignFirstResponder];
        [_textFieldTwo resignFirstResponder];
        _alert = [UIAlertController alertControllerWithTitle:nil message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        [_alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIActionSheetStyleDefault handler:nil]];
        [[self viewController] presentViewController:_alert animated:YES completion:nil];
    } else {
        [_textFieldOne resignFirstResponder];
        [_textFieldThree resignFirstResponder];
        [_textFieldTwo resignFirstResponder];
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        [[self viewController] presentViewController:_alert animated:YES completion:nil];
        [self performSelector:@selector(dismiss:) withObject:_alert afterDelay:2];
    }

}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}


-(void) dismiss:(UIAlertController*) alert {
    [alert dismissViewControllerAnimated:YES completion:nil];
}
@end
