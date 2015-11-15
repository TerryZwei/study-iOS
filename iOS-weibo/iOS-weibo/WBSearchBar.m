//
//  WBSearchBar.m
//  iOS-weibo
//
//  Created by terry on 15/10/29.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "WBSearchBar.h"

@interface WBSearchBar ()
@end
@implementation WBSearchBar

+ (instancetype)searchBar{
    
    
    return [[self alloc] init];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    //
    if (self) {
        //背景
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background"];

        //左边的放大镜图标
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        
        //图片居中
        iconView.contentMode = UIViewContentModeCenter;
        
        self.leftView = iconView;
        //文字
        self.font = [UIFont systemFontOfSize:13];
        //设置清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        iconView.frame = CGRectMake(0, 0, 30, 30);
        //    设置右边的提醒文字
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索" attributes:attrs];
        
        //设置键盘右下角按钮的样式
        self.returnKeyType = UIReturnKeySearch;
        //
        self.enablesReturnKeyAutomatically = YES;
        self.leftViewMode = UITextFieldViewModeAlways;
    }

    return self;
}
- (void)layoutSubviews
{

    [super layoutSubviews];
    

    
    
}
@end
