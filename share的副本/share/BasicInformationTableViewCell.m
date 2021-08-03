//
//  BasicInformationTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "BasicInformationTableViewCell.h"

@implementation BasicInformationTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"头像", @"昵称", @"签名", @"性别", @"邮箱",nil];
    int num = [reuseIdentifier intValue];
    self.textLabel.text = [nameArray objectAtIndex:num];
    if ([reuseIdentifier isEqualToString:@"0"]) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 10, 60, 60)];
        imageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_head.png"];
        [self addSubview:imageView];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"1"]) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 250, 40)];
        label.text = @"share小白";
        label.font = [UIFont systemFontOfSize:18];
        [self addSubview:label];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"2"]) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 250, 40)];
        label.text = @"开心了就笑，不开心就过会儿笑";
        label.font = [UIFont systemFontOfSize:18];
        [self addSubview:label];
        return self;
    } else if ([reuseIdentifier isEqualToString:@"3"]) {
        _buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(150, 10, 50, 30)];
        [_buttonOne setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/boy_button.png"] forState:UIControlStateSelected];
        [_buttonOne setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/girl_button.png"]
                forState:UIControlStateNormal];
        [_buttonOne setTitle:@"男" forState:UIControlStateNormal];
        _buttonOne.imageEdgeInsets = UIEdgeInsetsMake(3, 12, 3, 12);
        _buttonOne.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, -20);
        [_buttonOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _buttonOne.selected = YES;
        [_buttonOne addTarget:self action:@selector(press_boy) forControlEvents:UIControlEventTouchUpInside];
        
        _buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(230, 10, 50, 30)];
        [_buttonTwo setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/boy_button.png"] forState:UIControlStateSelected];
        [_buttonTwo setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/girl_button.png"] forState:UIControlStateNormal];
        [_buttonTwo setTitle:@"女" forState:UIControlStateNormal];
        _buttonTwo.imageEdgeInsets = UIEdgeInsetsMake(3, 12, 3, 12);
        _buttonTwo.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, -20);
        [_buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _buttonTwo.selected = NO;
        [_buttonTwo addTarget:self action:@selector(press_girl) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_buttonOne];
        [self addSubview:_buttonTwo];
        return self;
    } else {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 250, 40)];
        label.text = @"464408***@qq.com";
        label.font = [UIFont systemFontOfSize:18];
        [self addSubview:label];
        return self;
    }
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect adjustFrameOne = self.textLabel.frame;
    adjustFrameOne.origin.x += 20;
    self.textLabel.frame = adjustFrameOne;
}
-(void) press_boy {
    _buttonOne.selected = YES;
    _buttonTwo.selected = NO;
}
-(void) press_girl {
    _buttonOne.selected = NO;
    _buttonTwo.selected = YES;
}

@end
