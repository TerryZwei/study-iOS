//
//  TMessageCell.m
//  iOS-QQ聊天界面
//
//  Created by terry on 15/11/1.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "TMessageCell.h"
#import "TMessageFrame.h"
#import "TMessage.h"

@interface TMessageCell()
//时间
@property (nonatomic,weak) UILabel *timeView;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UIButton *textView;
@end

@implementation TMessageCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //1.时间
        UILabel *timeView = [[UILabel alloc] init];
        [self.contentView addSubview:timeView];
        self.timeView = timeView;
        //2.头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //3.正文
        UIButton *textView = [[UIButton alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{

    static NSString *ID = @"message";
    
    TMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
}
- (void)setMessageFrame:(TMessageFrame *)messageFrame
{

    _messageFrame = messageFrame;
    
    
    TMessage *message = messageFrame.message;
    
    //1.时间
    self.timeView.text =  message.time;
    self.timeView.frame = messageFrame.timeF;
    
    //2.头像
    self.iconView.image = [UIImage imageNamed:message.type == TMessageTypeMe?@"me":@"other"];
    self.iconView.frame = messageFrame.iconF;
    
    //3.正文
    [self.textView setTitle:message.text forState:UIControlStateNormal];
    self.textView.frame = messageFrame.textF;

}
@end
