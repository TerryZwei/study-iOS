//
//  TabBarButton.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//
//图标高的比例
#define TabBarButtonImageRatio 0.6
//按钮的默认文字颜色
#define TabBarButtonTitleColor (iOS7 ? [UIColor blackColor] : [UIColor whiteColor])
//按钮的选中文字颜色
#define TabBarButtonSelectedTitleColor (iOS7?WBColor(234,103,7) : WBColor(248,139,0))
#import "TabBarButton.h"
#import "UIImage+WB.h"
#import "WBBadgeButton.h"

@interface TabBarButton ()
//提醒数字
@property(nonatomic,weak)WBBadgeButton *badgeButton;
@end

@implementation TabBarButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (!iOS7) {
            
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
            
        }

        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:TabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:TabBarButtonSelectedTitleColor forState:UIControlStateSelected];
        
        //添加一个提醒数字按钮
        WBBadgeButton *badgeButton = [[WBBadgeButton alloc] init];
        
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * TabBarButtonImageRatio;
    NSLog(@"%f--%f",imageH,imageW);
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * TabBarButtonImageRatio;
    CGFloat titleH = contentRect.size.height - titleY;
    CGFloat titleW = contentRect.size.width;

    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setHighlighted:(BOOL)highlighted
{

}
- (void)setItem:(UITabBarItem *)item
{

    _item = item;
        //KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}
- (void)dealloc
{

    //释放监听
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    
}
/**
 *  监听到某个对象的属性改变了，就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateHighlighted];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    //设置提醒数字
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    //设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width -10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
    
    
}
@end
