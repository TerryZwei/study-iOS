//
//  WBTabBar.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "WBTabBar.h"
#import "UIImage+WB.h"
#import "TabBarButton.h"

@interface WBTabBar ()
@property (weak,nonatomic)TabBarButton *selectedButton;
@property (strong,nonatomic) NSMutableArray *tabBarButtons;
@property (weak,nonatomic)UIButton *plusButton;
@end
@implementation WBTabBar
//初始化TabBar
- (instancetype)initWithFrame:(CGRect)frame
{

    self =  [super initWithFrame:frame];
    if (self) {
        if(!iOS7){
        
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
            
        }
        //添加加号按钮
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
        [self addSubview:plusButton];
        self.plusButton = plusButton;
    }

    return self;
}
- (NSMutableArray *)tabBarButtons
{

    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
        
    }
    return _tabBarButtons;

}
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{

    //1.创建按钮
    TabBarButton *button = [[TabBarButton alloc]init];
    [self addSubview:button];
    //5.添加按钮到数组中
    [self.tabBarButtons addObject:button];
    //2.设置数据(封装)
    button.item = item;
//    [button setTitle:item.title forState:UIControlStateNormal];
//    [button setImage:item.image forState:UIControlStateNormal];
//    [button setImage:item.selectedImage forState:UIControlStateSelected];
//    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
    
    //3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //4.默认选中第0个按钮
    if(self.tabBarButtons.count == 1){
    
        [self buttonClick:button];
    }
    
    
}
/**
 *  监听按钮点击
 *
 *  @param button <#button description#>
 */
- (void)buttonClick:(TabBarButton *)button
{
    //1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }

    //2.设置按钮状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;

}
- (void)layoutSubviews
{

    [super layoutSubviews];

    //调整加号按钮的frame
    NSLog(@"%f",self.frame.size.width);
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
    
    CGFloat buttonH = h;
    CGFloat buttonW = w/self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        //1.取出按钮
        TabBarButton *button = self.tabBarButtons[index];
        
        //2.设置按钮的frame
        CGFloat buttonX = index *buttonW;
        if (index > 1){
        
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //3.绑定按钮tag
        button.tag = index;
        
        
    }

}
@end
