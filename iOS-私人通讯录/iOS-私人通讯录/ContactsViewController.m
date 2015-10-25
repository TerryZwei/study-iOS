//
//  ContactsViewController.m
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddViewController.h"
#import "ContactModel.h"
#import "EditViewController.h"
#import "ContactCell.h"

@interface ContactsViewController()<AddViewControllerDelegate,EditViewControllerDelegate>
- (IBAction)logout:(id)sender;
@property(nonatomic,strong)NSMutableArray *contacts;
@end
@implementation ContactsViewController
-(NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }

    return _contacts;
}




/**
 *  点击注销
 *
 *  @param sender <#sender description#>
 */
- (IBAction)logout:(id)sender {
    //不再使用actionSheet
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"确定要注销" message:@"haha" preferredStyle:UIAlertControllerStyleActionSheet];
    //添加Button
    [sheet addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }]];
    
    [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:sheet animated:YES completion:nil];
    
    
}
/**
 *  
 *
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    id vc = segue.destinationViewController;
    
    if ([vc isKindOfClass:[AddViewController class]]) {
        
        AddViewController *addVc = vc;
        
        addVc.delegate = self;
    }else if([vc isKindOfClass:[EditViewController class]]){
    
        //给控制器传递数据
        
        EditViewController *editVc = vc;
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        editVc.contact = self.contacts[path.row];
        
        editVc.delegate = self;
    
    }

    
    
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}
#pragma mark -AddViewController代理方法
- (void)addViewController:(AddViewController *)addVc didContact:(ContactModel *)contact{

    //1.添加模型数据
    [self.contacts addObject:contact];
    //2.刷新表格
    [self.tableView reloadData];

}
#pragma mark - 实现EditViewController代理方法
- (void)editViewController:(EditViewController *)editVc didContact:(ContactModel *)contact
{
    //1.刷新表格
    [self.tableView reloadData];

}

#pragma mark -Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.contacts.count;
    
}
#pragma mark 设置单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ContactCell *cell = [ContactCell cellWithTableView:tableView];
    
    //2.设置cell数据

    cell.contact = self.contacts[indexPath.row];
//    cell.textLabel.text = contact.name;
//    cell.detailTextLabel.text = contact.tel;
//    NSLog(@"%@",contact.tel);
    //设置每一个单元格的箭头
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
@end
