//
//  MessageViewController.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "MessageViewController.h"

@implementation MessageViewController
-(void)viewDidLoad
{

    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:nil action:nil];
    

    self.navigationItem.rightBarButtonItem.enabled = NO;
}
@end
