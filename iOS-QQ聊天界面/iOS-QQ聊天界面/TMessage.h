//
//  TMessage.h
//  iOS-QQ聊天界面
//
//  Created by terry on 15/11/1.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {

    TMessageTypeMe = 0,//自己发的
    
    TMessageTypeOther //别人发的
    
    
} TMessageType;

@interface TMessage : NSObject
@property (copy,nonatomic) NSString *text;
@property (copy,nonatomic) NSString *time;
@property (assign,nonatomic) TMessageType type;

+(instancetype)messageWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
