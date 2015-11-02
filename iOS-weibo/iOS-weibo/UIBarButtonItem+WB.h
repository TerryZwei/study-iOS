//
//  UIBarButtonItem+WB.h
//  iOS-weibo
//
//  Created by terry on 15/10/29.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WB)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
