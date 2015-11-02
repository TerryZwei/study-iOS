//
//  DiscoverViewController.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "DiscoverViewController.h"
#import "UIImage+WB.h"
#import "WBSearchBar.h"

@implementation DiscoverViewController
- (void)viewDidLoad
{

    [super viewDidLoad];
    
    WBSearchBar *searchBar = [WBSearchBar searchBar];
    //设置大小
    searchBar.frame = CGRectMake(0, 0, 300, 30);
    self.navigationItem.titleView = searchBar;
    

}
@end
