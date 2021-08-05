//
//  ChatViewController.m
//  share
//
//  Created by haoqianbiao on 2021/8/4.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "ChatViewController.h"

# define W ([UIScreen mainScreen].bounds.size.width)
# define H ([UIScreen mainScreen].bounds.size.height)

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"chat";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSForegroundColorAttributeName:[UIFont systemFontOfSize:23]}];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(W * 0.07, H * 0.74, W * 0.75, H * 0.06)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    
    UIButton* sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendButton.backgroundColor = [UIColor colorWithRed:0.27 green:0.55 blue:0.8 alpha:1];
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchDown];
    sendButton.frame = CGRectMake(W * 0.83, H * 0.74, W * 0.15, H * 0.06);
    sendButton.layer.borderWidth = 1;
    sendButton.layer.cornerRadius = 10;
    
    [self.view addSubview:_textField];
    [self.view addSubview:sendButton];
    
    _tableView = [[UITableView alloc]  initWithFrame:CGRectMake(0, 0, W, H * 0.6) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置分割线（设置为无样式）
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.showsVerticalScrollIndicator = self;
    [self.view addSubview:_tableView];
    
    _messageArray = [NSMutableArray arrayWithObjects:@"选择总是会有代价的，承受它就好了", @"当你见到我时，我已是更好的自己", @"自律并不是一个什么远在天边的大词儿，它是你每一天每一分钟，能在那些不想做的一瞬间，说服自己咬着牙继续坚持下去", @"永远有期待", nil];
    _rowHeightArray = [[NSMutableArray alloc] init];
    for (NSString* str in _messageArray) {
        //因为boundingRectWithSize: options: attributes: context 函数中参数三需要使用数组
        //P1:文本显示的最大宽度和最大高度
        //P2：计算的类型 NSStringDrawingUsesLineFragmentOrigin 绘制文本时使用，一般使用这项
        //P3:文本属性
        //P4:包括一些信息，例如如何调整字间距以及缩放
        NSDictionary* attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.41) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        //聊天框高度，+ W * 0.15位了保持会话之间的距离
        int height = size.height + W * 0.15;
        _rowHeight = [NSNumber numberWithInt:height];
        [_rowHeightArray addObject:_rowHeight];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

-(void) send {
    [_messageArray addObject:_textField.text];
    NSDictionary* attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    //自适应高度，并计算
    CGSize size = [_textField.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    int height = size.height + W * 0.15;
    _rowHeight = [NSNumber numberWithInt:height];
    [_rowHeightArray addObject:_rowHeight];
    //_messageArray.count - 1: 显示的最后一行
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:(_messageArray.count - 1) inSection:0];
    //加入一个cell
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    [_tableView reloadData];
    //滚动界面（随着消息发送上移）
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    //清空textField
    _textField.text = @"";
    
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    } else {
        //tableView的复用，如果不删除，会出现bug
        //删除cell所有的子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    //分割线风格（无显示）
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //一人一句话
    if (indexPath.row % 2 != 0) {
        //设置头像
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageStr]];
        imageView.frame = CGRectMake(W * 0.01, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        //设置对话框
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary *attri = @{NSFontAttributeName:label.font};
        //自适应高度
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.13, W * 0.07, size.width, size.height + W * 0.05);
        //设置聊天气泡
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        imageViewBubble.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        imageViewBubble.frame = CGRectMake(W * 0.12, W * 0.07, size.width + W * 0.05, size.height + W * 0.03);
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
    } else {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/works_head.png"]];
        imageView.frame = CGRectMake(W * 0.89, W * 0.01, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary *attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.86 - size.width, W * 0.05, size.width, size.height);
        
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        imageViewBubble.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        imageViewBubble.frame = CGRectMake(W * 0.82 - size.width, W * 0.03, size.width + W * 0.05, size.height + W * 0.03);
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
    }
    return cell;
}

-(void) keyboardWillAppear:(NSNotification *)notification {
     //计算键盘高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    //视图整体上升
    [UIView animateWithDuration:1.0 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height - 90);
    }];
}

-(void) keyboardWillDisappear:(NSNotification *)notification {
    //第一个参数是动画持续时间
    //第二个参数是方法，这里让视图恢复原来的位置就好
    [UIView animateWithDuration:1 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageArray.count;
}

//点击空白处回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField endEditing:YES];
}

//点击return回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    return YES;
}

//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //将NSNumber型的height转换为CGFloat型
    CGFloat height = [_rowHeightArray[indexPath.row] floatValue];
    return height;
}

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
