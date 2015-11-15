//
//  TYTgCell.h
//  iOS-团购
//
//  Created by terry on 15/11/9.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYTg;

@interface TYTgCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) TYTg *tg;
@end
