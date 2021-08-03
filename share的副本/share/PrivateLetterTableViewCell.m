//
//  PrivateLetterTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PrivateLetterTableViewCell.h"

@implementation PrivateLetterTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", nil];
    NSArray* nameArrayOne = [[NSArray alloc] initWithObjects:@"你的作品我很喜欢", @"谢谢，已关注你", @"为你点赞", @"你好，可以问问你是怎么拍的吗？", nil];
     NSArray* nameArrayTwo = [[NSArray alloc] initWithObjects:@"11-03 09 45", @"11-03 10 00", @"11-03 10 23", @"11-03 11 20", nil];
    int num = [reuseIdentifier intValue];
    NSString* str = [[NSString alloc] initWithFormat:@"/Users/haoqianbiao/Desktop/test1/UI/share/头像/WechatIMG%d.jpeg", num + 25];
   
    self.textLabel.text = [nameArray objectAtIndex:num];
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.imageView.image =[UIImage imageNamed:str];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 250, 30)];
    label.textColor = [UIColor blueColor];
    label.text = [nameArrayOne objectAtIndex:num];
    label.font = [UIFont systemFontOfSize:15];
    UILabel* labelOne = [[UILabel alloc] initWithFrame:CGRectMake(320, 3, 80, 20)];
    labelOne.textColor = [UIColor grayColor];
    labelOne.text = [nameArrayTwo objectAtIndex:num];
    labelOne.font = [UIFont systemFontOfSize:10];
    [self addSubview:labelOne];
    [self addSubview:label];
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect adjustFrameOne = self.textLabel.frame;
    adjustFrameOne.origin.x -= 15;
    adjustFrameOne.origin.y -= 10;
    self.textLabel.frame = adjustFrameOne;
    CGRect adjustFrame = self.imageView.frame;
    adjustFrame = CGRectMake(20, 10, 80, 80);
    self.imageView.frame = adjustFrame;
    
}
@end
