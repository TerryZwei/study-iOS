//
//  UIImage+WB.h
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
//判断版本
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//获得RGB颜色
#define WBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface UIImage (WB)
+ (UIImage *)imageWithName:(NSString *)name;
+ (UIImage *)resizeImageWithName:(NSString *)name;
@end
