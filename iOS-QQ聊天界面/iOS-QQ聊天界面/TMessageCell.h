//
//  TMessageCell.h
//  iOS-QQ聊天界面
//
//  Created by terry on 15/11/1.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMessageFrame;
@interface TMessageCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) TMessageFrame *messageFrame;
@end
