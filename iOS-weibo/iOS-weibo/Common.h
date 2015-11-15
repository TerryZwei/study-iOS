//
//  Common.h
//  iOS-weibo
//
//  Created by terry on 15/10/29.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
//自定义Log
#ifdef DEBUG
#define WBLog(...) NSLog(__VA_ARGS__)
#else
#define WBLog(...)
#endif
@interface Common : NSObject

@end
