//
//  TYTg.m
//  iOS-团购
//
//  Created by terry on 15/11/9.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "TYTg.h"

@implementation TYTg
+ (instancetype)tgWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];

}
- (instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }

    return self;
}
@end
