//
//  TabBarViewController.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"
#import "DiscoverViewController.h"
#import "UIImage+WB.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    //初始化所有子控制器
    [self setupAllChildViewControllers];
    
    
}
/**
 *  初始化所有子控制器
 */
- (void)setupAllChildViewControllers
{

    //1.首页
    HomeViewController *home = [[HomeViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    
    //2.消息
    MessageViewController *message = [[MessageViewController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    
    //3.广场
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    //4.我
    MeViewController *me = [[MeViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];

}

/**
 *  初始化一个自控制器
 *
 *  @param childVc           需要出示化的自控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{

    //1设置控制器的属性
//    childVc.tabBarItem.title = title;
//    childVc.navigationItem.title = title;
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];

        
}

@end
