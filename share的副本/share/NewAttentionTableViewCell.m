//
//  NewAttentionTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "NewAttentionTableViewCell.h"

@implementation NewAttentionTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌", @"shareLity", nil];
    int num = [reuseIdentifier intValue];
    NSString* str = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/头像/WechatIMG%d.jpeg", num + 25];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(300, 30, 60, 30)];
    [button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/guanzhu_normal.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/guanzhu_pressed.png"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    self.textLabel.text = [nameArray objectAtIndex:num];
    [self addSubview:button];
    self.imageView.image =[UIImage imageNamed:str];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect adjustFrameOne = self.textLabel.frame;
    adjustFrameOne.origin.x += 20;
    self.textLabel.frame = adjustFrameOne;
    CGRect adjustFrame = self.imageView.frame;
    adjustFrame = CGRectMake(20, 10, 80, 80);
    self.imageView.frame = adjustFrame;
}

-(void) press:(UIButton*)button {
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}
@end
