//
//  EditViewController.h
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactModel,EditViewController;
@protocol EditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(EditViewController *)editVc didContact:(ContactModel *)contact;

@end
@interface EditViewController : UIViewController
@property (nonatomic,strong)ContactModel *contact;
@property (nonatomic,strong) id<EditViewControllerDelegate> delegate;
@end
