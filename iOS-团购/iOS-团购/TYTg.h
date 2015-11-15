//
//  TYTg.h
//  iOS-团购
//
//  Created by terry on 15/11/9.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYTg : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
