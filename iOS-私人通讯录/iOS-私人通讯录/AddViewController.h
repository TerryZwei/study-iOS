//
//  AddViewController.h
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddViewController,ContactModel;
//协议名称
@protocol AddViewControllerDelegate <NSObject>
//代理的方法
@optional
//- (void)addViewController:(AddViewController *)addVc contactName:(NSString *)name contactPhone:(NSString *)tel;
- (void)addViewController:(AddViewController *)addVc didContact:(ContactModel *)contact;
@end

@interface AddViewController : UIViewController
//代理属性
@property(nonatomic,weak) id<AddViewControllerDelegate> delegate;
@end
