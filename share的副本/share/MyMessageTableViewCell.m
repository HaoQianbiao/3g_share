//
//  MyMessageTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MyMessageTableViewCell.h"

@implementation MyMessageTableViewCell
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img3.png"]];
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
