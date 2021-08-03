//
//  MessageSetTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MessageSetTableViewCell.h"

@implementation MessageSetTableViewCell
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"接受所有消息通知", @"通知显示栏", @"声音", @"震动", @"关注更新", nil];
    int num = [reuseIdentifier intValue];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(300, 10, 30, 30)];
    [button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/my_button_normal.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/my_button_pressed.png"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    self.textLabel.text = [nameArray objectAtIndex:num];
    [self addSubview:button];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect adjustFrameOne = self.textLabel.frame;
    adjustFrameOne.origin.x += 20;
    self.textLabel.frame = adjustFrameOne;
}

-(void) press:(UIButton*)button {
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}
@end
