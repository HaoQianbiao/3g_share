//
//  SettingTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/share+4.18最终/新建文件夹/素材/logo/img3.png"]];
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect adjustFrameOne = self.textLabel.frame;
    adjustFrameOne.origin.x += 30;
    self.textLabel.frame = adjustFrameOne;
    CGRect adjustedFrame = self.accessoryView.frame;
    adjustedFrame.origin.x  -= 70;
    self.accessoryView.frame = adjustedFrame;
}

@end
