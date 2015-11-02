//
//  UIImage+WB.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "UIImage+WB.h"

@implementation UIImage (WB)
/**
 *  判断ios版本返回对应的图片
 *
 *  @param name 图片名称
 *
 *  @return <#return value description#>
 */
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
/**
 *  返回一张自由拉伸的图片
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)resizeImageWithName:(NSString *)name
{

    UIImage *image = [UIImage imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];

}
@end
