//
//  WBTabBar.h
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBTabBar;
@protocol WBTabBarDelegate <NSObject>

@optional

- (void)tabBar:(WBTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface WBTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@property (nonatomic,weak) id<WBTabBarDelegate> delegate;
@end
