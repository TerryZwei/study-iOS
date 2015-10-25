//
//  AddViewController.m
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "AddViewController.h"
#import "ContactModel.h"
@interface AddViewController()
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *telField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)addContact;

@end
@implementation AddViewController
- (void)viewDidLoad
{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.telField];
}
//等控制器的view完全显示出来再调用方法
- (void)viewDidAppear:(BOOL)animated
{

    [super viewDidAppear:animated];
    
    //自动弹按钮
    //    [self.view  endEditing:YES];
    //    [self.nameField resignFirstResponder];
    //让姓名输入框成为第一响应者，弹出键盘
    [self.nameField becomeFirstResponder];
}



- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange
{

    self.addBtn.enabled = (self.nameField.text.length && self.telField.text.length);
    
}
/**
 *  添加操作
 */
- (IBAction)addContact {
    //1.关闭当前控制器
    [self.navigationController popViewControllerAnimated:YES];
    //2.传递数据给上一个控制器（）
    //当一个对象发生一些事情可以告诉另外一个对象（代理是接受数据那个）
    //2.通知代理
    if ([self.delegate respondsToSelector:@selector(addViewController:didContact:)]){
    
        ContactModel *contact = [[ContactModel alloc]init];
        contact.name = self.nameField.text;
        contact.tel = self.telField.text;
        [self.delegate addViewController:self didContact:contact];
        
    
    }
}
@end
