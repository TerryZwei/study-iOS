//
//  ContactCell.m
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ContactCell.h"
#import "ContactModel.h"

@interface ContactCell ()

@property (nonatomic,weak)UIView *divider;
@end
@implementation ContactCell
- (void)setContact:(ContactModel *)contact
{

    _contact = contact;
    
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.tel;

}
+ (instancetype)cellWithTableView:(UITableView *) tableView
{
    //先从缓存池中取，如果缓存池中没有可循环利用的cell，先去storyboard中找到合适的cell
    //cell是从storyboard中创建的
    //如果cell是通过storyboard或者xib创建的，就不可能会调用这个方法initWithStyle来初始化cell
    //如果cell是通过手写代码创建，才会调用initWithStyle
    static NSString *ID = @"contact";
    return [tableView dequeueReusableCellWithIdentifier:ID];

}
- (void)awakeFromNib
{

    //初始化cell
    UIView *divider = [[UIView alloc]init];
    divider.backgroundColor = [UIColor blackColor];
    divider.alpha = 0.2;
    [self.contentView addSubview:divider];
    
    self.divider = divider;

}

-(void)layoutSubviews
{

    [super layoutSubviews];
    //设置子控件的frame
    CGFloat dividerX = 0;
    CGFloat dividerH = 1;
    CGFloat dividerY = self.frame.size.height - dividerH;
    CGFloat dividerW = self.frame.size.width;
    
    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}
@end
