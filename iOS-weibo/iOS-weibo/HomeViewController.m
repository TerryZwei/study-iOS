//
//  HomeViewController.m
//  iOS-weibo
//
//  Created by terry on 15/10/25.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "HomeViewController.h"
#import "WBBadgeButton.h"
#import "UIImage+WB.h"
#import "Common.h"
#import "UIBarButtonItem+WB.h"

@implementation HomeViewController
- (void)viewDidLoad
{

    [super viewDidLoad];

    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" highIcon:@"navigationbar_friendsearch_highlighted" target:(id)self action:@selector(findFriend)];
    
    //右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop" highIcon:@"navigationbar_pop_highlighted" target:(id)self action:@selector(pop)];
    
    //设置中间按钮
    UIButton *titleButton = [[UIButton alloc] init];
    //高亮的时候不要自动调整图标
    titleButton.adjustsImageWhenHighlighted = NO;
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setBackgroundImage:[UIImage resizeImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    
    [titleButton setTitle:@"哈哈" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    titleButton.frame = CGRectMake(0, 0, 100, 30);
    self.navigationItem.titleView = titleButton;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //1.创建cell
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    cell.textLabel.text = @"hahah";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"1");
    UIViewController *vc = [[UIViewController alloc] init];

    [vc.view setBackgroundColor:[UIColor blackColor]];
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  <#Description#>
 */
- (void)findFriend
{

    WBLog(@"findFriend");
    

}
- (void)pop
{
    
    WBLog(@"pop");
    
    
}

@end
