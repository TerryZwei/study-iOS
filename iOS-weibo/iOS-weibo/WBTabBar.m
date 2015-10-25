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
@end
@implementation WBTabBar
- (instancetype)initWithFrame:(CGRect)frame
{

    self =  [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
    }

    return self;
}
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{

    //1.创建按钮
    TabBarButton *button = [[TabBarButton alloc]init];
    [self addSubview:button];

    //2.设置数据
    button.item = item;
//    [button setTitle:item.title forState:UIControlStateNormal];
//    [button setImage:item.image forState:UIControlStateNormal];
//    [button setImage:item.selectedImage forState:UIControlStateSelected];
//    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
    
    //3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //4.默认选中第0个按钮
    if(self.subviews.count == 1){
    
        [self buttonClick:button];
    }
    
}
- (void)buttonClick:(TabBarButton *)button
{

    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;

}
- (void)layoutSubviews
{

    [super layoutSubviews];
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width/self.subviews.count;
    CGFloat buttonY = 0;
    for (int index = 0; index<self.subviews.count; index++) {
        //1.取出按钮
        TabBarButton *button = self.subviews[index];
        
        //2.设置按钮的frame
        CGFloat buttonX = index *buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        
    }

}
@end
