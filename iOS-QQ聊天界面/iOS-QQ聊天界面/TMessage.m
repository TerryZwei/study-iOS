//
//  TMessage.m
//  iOS-QQ聊天界面
//
//  Created by terry on 15/11/1.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "TMessage.h"

@implementation TMessage
+(instancetype)messageWithDict:(NSDictionary *)dict
{

    return [[self alloc] initWithDict:dict];

}
-(instancetype)initWithDict:(NSDictionary *)dict
{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
