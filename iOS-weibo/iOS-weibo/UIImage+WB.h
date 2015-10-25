//
//  UIImage+WB.h
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@interface UIImage (WB)
+ (UIImage *)imageWithName:(NSString *) name;
@end
