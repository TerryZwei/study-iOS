//
//  UIImage+WB.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "UIImage+WB.h"

@implementation UIImage (WB)
+ (UIImage *)imageWithName:(NSString *) name
{

    if (iOS7) {
        
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) {
            //没有iOS7图片
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    return [UIImage imageNamed:name];

}
@end
