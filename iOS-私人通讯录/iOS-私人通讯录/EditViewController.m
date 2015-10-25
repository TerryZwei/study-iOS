//
//  EditViewController.m
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "EditViewController.h"
#import "ContactModel.h"
@interface EditViewController()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@property (weak, nonatomic) IBOutlet UITextField *telField;
- (IBAction)edit:(UIBarButtonItem *)sender;
- (IBAction)save;


@end
@implementation EditViewController
- (void)viewDidLoad
{

    self.nameField.text = _contact.name;
    self.telField.text = _contact.tel;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.telField];

}

-(void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)textChange
{

    self.saveBtn.enabled = (self.telField.text.length && self.nameField.text.length);
    
    
}
//
//- (void)setContact:(ContactModel *)contact
//{
//
//    _contact = contact;
//    self.nameField.text = _contact.name;
//    self.nameField.text = _contact.tel;
//
//}
- (IBAction)edit:(UIBarButtonItem *)sender {
    if (self.nameField.enabled) {
        
        self.nameField.enabled =NO;
        self.telField.enabled = NO;
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        sender.title = @"编辑";
        
        self.nameField.text = self.contact.name;
        self.telField.text = self.contact.tel;
    }else {
        
        self.nameField.enabled =YES;
        self.telField.enabled = YES;
        [self.telField becomeFirstResponder];
        self.saveBtn.hidden = NO;
        sender.title = @"取消";
        
    
    }
}

- (IBAction)save {
    
    //1.关闭当前页面
    [self.navigationController popViewControllerAnimated:YES];
    //2.设置代理
    if ([self.delegate respondsToSelector:@selector(editViewController:didContact:)]) {
        
        self.contact.name = self.nameField.text;
        self.contact.tel = self.telField.text;
        
        [self.delegate editViewController:self didContact:self.contact];
    }
    
    
    
}
@end
