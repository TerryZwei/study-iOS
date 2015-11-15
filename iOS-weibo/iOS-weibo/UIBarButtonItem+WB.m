//
//  UIBarButtonItem+WB.m
//  iOS-weibo
//
//  Created by terry on 15/10/29.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "UIBarButtonItem+WB.h"
#import "UIImage+WB.h"

@implementation UIBarButtonItem (WB)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:highIcon] forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero,btn.currentBackgroundImage.size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}
@end
