//
//  TabBarButton.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//
//图标高的比例
#define TabBarButtonImageRatio 0.6
#import "TabBarButton.h"
#import "UIImage+WB.h"

@implementation TabBarButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];

        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * TabBarButtonImageRatio;
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

        [self setTitle:item.title forState:UIControlStateNormal];
        [self setImage:item.image forState:UIControlStateNormal];
        [self setImage:item.selectedImage forState:UIControlStateSelected];
    

}
@end
