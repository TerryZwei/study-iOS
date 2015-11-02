//
//  WBNavigationController.m
//  iOS-weibo
//
//  Created by terry on 15/10/28.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "WBNavigationController.h"
#import "UIImage+WB.h"
@implementation WBNavigationController

/**
 *  第一次使用这个类的时候会调用（1个类只会调用1次）
 */
+ (void)initialize
{

    //1.设置导航栏主题
    [self setupNavBarTheme];
    
    //设置导航栏按钮的主题
    [self setupBarButtonItemTheme];
    
    
}
+ (void)setupBarButtonItemTheme
{

    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置背景
    if (!iOS7) {
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = iOS7 ?[UIColor orangeColor]: [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:iOS7?14:12];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];

    
}
+ (void)setupNavBarTheme
{

    //取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //2.设置背景
    //    [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    //
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}
@end
