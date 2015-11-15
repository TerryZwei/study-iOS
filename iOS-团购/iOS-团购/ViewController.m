//
//  ViewController.m
//  iOS-团购
//
//  Created by terry on 15/11/9.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ViewController.h"
#import "TYTg.h"
#import "TYTgCell.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic, strong)NSArray *tags;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 80;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//懒加载
- (NSArray *)tags
{

    if (_tags == nil) {
        
        
        //初始化
        //1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        //2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        //3.将dictArray里面的所有字典转成模型对象，放到新的数组中
        NSMutableArray *tgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            //
            TYTg *tg = [TYTg tgWithDict:dict];
            [tgArray addObject:tg];
        }
        //赋值
        _tags = tgArray;
        
    }
    return _tags;
}

#pragma mark -数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.tags.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TYTgCell *cell = [TYTgCell cellWithTableView:tableView];
    
    cell.tg = self.tags[indexPath.row];
    
    return cell;
}
@end
