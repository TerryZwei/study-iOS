//
//  ViewController.m
//  iOS-fmdb
//
//  Created by terry on 15/11/14.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ViewController.h"
#import "CenterController.h"
#import "MenuViewCellTableViewController.h"
#import "FMDB.h"
#import "UIView+Size.h"

@interface ViewController ()
@property (nonatomic,strong) FMDatabase *db;
- (IBAction)insert;
- (IBAction)update;
- (IBAction)delete;
- (IBAction)query;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取沙盒中的数据库文件名
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"%@",filename);
    //创建数据库对象
    self.db = [FMDatabase databaseWithPath:filename];
    
    //打开数据库
    if (![self.db open]) {
        NSLog(@"打开数据库失败");
    }else {
    
        //创建表
        BOOL result = [self.db executeUpdate:@"create table if not exists t_student(id integer primary key autoincrement, name text, age integer);"];
        
        if (result) {
            NSLog(@"create success");
        }else {
        
            NSLog(@"create error");
        }
    
    }
    //1.初始化自控制器
    MenuViewCellTableViewController *menuVc = [[MenuViewCellTableViewController alloc] init];
    menuVc.view.width = 150;
    menuVc.view.y = 0;
    [self.view addSubview:menuVc.view];
    [self addChildViewController:menuVc];
    
    CenterController *centerVc = [[CenterController alloc] init];
    centerVc.view.frame = self.view.bounds;
    [self.view addSubview:centerVc.view];
    [self addChildViewController:centerVc];
    //监听手势
    
    [centerVc.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragCenterView:)]];
}
- (void)dragCenterView:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];
    
    // 结束拖拽
    if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded) {
        if (pan.view.x >= 150 * 0.5) { // 往右边至少走动了75
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformMakeTranslation(150, 0);
            }];
        } else { // 走动距离的没有达到75
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformIdentity;
            }];
        }
    } else { // 正在拖拽中
        pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, 0);
        [pan setTranslation:CGPointZero inView:pan.view];
        
        if (pan.view.x >= 150) {
            pan.view.transform = CGAffineTransformMakeTranslation(150, 0);
        } else if (pan.view.x <= 0) {
            pan.view.transform = CGAffineTransformIdentity;
        }
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insert {
    for (int i= 0; i< 40; i++) {
        NSString *name = [NSString stringWithFormat:@"rose--%d",arc4random()%1000];
        NSNumber *age = @(arc4random()%100+1);
        [self.db executeUpdate:@"insert into t_student (name, age) values (?, ?)",name,age];
    };
    
}

- (IBAction)update {
    
    [self.db executeUpdate:@"update t_student set age = ? where name = ?",@20,@"jack"];
}

- (IBAction)delete {
}

- (IBAction)query {
    
    FMResultSet *rs =[self.db executeQuery:@"select * from t_student"];
    while (rs.next) {
        int ID =[rs intForColumn:@"id"];
        NSString *name = [rs stringForColumn:@"name"];
        int age = [rs intForColumn:@"age"];
        
        
        NSLog(@"%d %@ %d",ID,name,age);
        
    }
}
@end
