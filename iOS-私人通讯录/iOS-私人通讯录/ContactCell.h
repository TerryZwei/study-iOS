//
//  ContactCell.h
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactModel;

@interface ContactCell : UITableViewCell
@property (nonatomic,strong) ContactModel *contact;
+ (instancetype)cellWithTableView:(UITableView *) tableView;
@end
