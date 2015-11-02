//
//  WBBadgeButton.m
//  iOS-weibo
//
//  Created by terry on 15/10/26.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "WBBadgeButton.h"
#import "UIImage+WB.h"

@implementation WBBadgeButton
- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        
        //按钮不能点击
        self.userInteractionEnabled = NO;
        //隐藏按钮
        self.hidden = YES;
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
    }
    
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{

#warning copy
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        
        //设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        //设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        //文字尺寸
        if (badgeValue.length > 1) {
            CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];
            badgeW = badgeSize.width+10;
        }
        frame.size.height = badgeH;
        frame.size.width = badgeW;
        
        self.frame = frame;
    }else{
        
        self.hidden = YES;
    }


}
@end
