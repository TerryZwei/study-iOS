//
//  TMessageFrame.m
//  iOS-QQ聊天界面
//
//  Created by terry on 15/11/1.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "TMessageFrame.h"
#import "TMessage.h"

@implementation TMessageFrame
//
- (CGSize)sizeWithText:(NSString)

- (void)setMessage:(TMessage *)message
{

    _message = message;
    //间距
    CGFloat padding = 10;
    //屏幕的宽度
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    //1.时间
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screenW;
    CGFloat timeH = 40;
    _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    
    //2.头像
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    CGFloat iconX;
    if (message.type == TMessageTypeMe) {
        iconX = padding;
    }else{
    
        iconX = screenW - padding - iconW;
    }

    //3.正文
}
@end
