//
//  ViewController.m
//  iOS-autolayout
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
//    blueView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:blueView];
    //创建view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
//    redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:redView];
    //禁用autoresizing
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    //创建并添加约束
    //两个view高度永远都是50
    //blueView约束
    //A对象的某属性关系 = B对象的某属性*multiplier+constant
    //参数1的参数2 = 参数4的参数5*参数6+参数7
    NSLayoutConstraint *blueHC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [blueView addConstraint:blueHC];
    
    
     NSLayoutConstraint *blueLC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];

    
    NSLayoutConstraint *blueTC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];

    
    
    NSLayoutConstraint *blueRC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    
    [self.view addConstraint:blueLC];
    [self.view addConstraint:blueTC];
    [self.view addConstraint:blueRC];
    
    //2.1让红色view的height等于蓝色view的高度
    NSLayoutConstraint *redHC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:redHC];
    
    //2.2让红色view的top距离蓝色view30
    NSLayoutConstraint *redTC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    [self.view addConstraint:redTC];
    
    //2.3红色view和蓝色view右对齐
    NSLayoutConstraint *redRC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:redRC];
    
    //2.4红色view的宽度等于蓝色view的宽度的0.5倍
    //2.3红色view和蓝色view右对齐
    NSLayoutConstraint *redWC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:redWC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
