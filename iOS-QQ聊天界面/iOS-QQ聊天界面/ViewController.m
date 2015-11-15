//
//  ViewController.m
//  iOS-QQ聊天界面
//
//  Created by terry on 15/11/1.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ViewController.h"
#import "TMessage.h"
#import "TMessageCell.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *message;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)message
{

    if (_message == nil) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        
        NSMutableArray *msgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            //模型
            TMessage *msg = [TMessage messageWithDict:dict];
            
            //添加模型
            [msgArray addObject:msg];
        }
        _message = msgArray;
        
    }
    
    return _message;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.message.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //1.创建cell
    TMessageCell *cell = [TMessageCell cellWithTableView:tableView];
    //2.给cell传递模型
    //3.返回cell
    return cell;
}
@end
