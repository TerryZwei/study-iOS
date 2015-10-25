//
//  LoginViewController.m
//  iOS-私人通讯录
//
//  Created by terry on 15/10/24.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rmbSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoSwitch;
- (IBAction)rmbPwdChange;
- (IBAction)autoLoginChange;

- (IBAction)login;
@end
@implementation LoginViewController
- (void)viewDidLoad
{
    //监听事件的方法：addTarget,设置代理，通知
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    
    
}

#pragma mark - 移除通知
- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  文本框的文字发生变化的时候调用
 */

- (void) textChange
{

    self.loginBtn.enabled = self.accountField.text.length && self.pwdField.text.length;
    
}
/**
 *  记住密码的开关的调用
 */
- (IBAction)rmbPwdChange {
    
    if (self.rmbSwitch.isOn == NO) {
        [self.autoSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLoginChange {
    if (self.autoSwitch.isOn) {
        [self.rmbSwitch setOn:YES animated:NO];
    }
}

- (IBAction)login {
    
    if ([self.accountField.text isEqualToString:@"1"] && [self.pwdField.text isEqualToString:@"1"]) {
    
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.labelText = @"Loading";
        hud.dimBackground =YES;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
            //执行login2contacts这条线
            [self performSegueWithIdentifier:@"login2contacts" sender:nil];
            
            
        });
        
        
    }else{
    
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
/**
 *  执行segue后，跳转之前会调用这个方法
 *  一般在这里给下一个控制器传递数据
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

//    NSLog(@"%@ %@ %@",segue.identifier,segue.sourceViewController,segue.destinationViewController);
    //1.取得目标控制器
    UIViewController *contactVc = segue.destinationViewController;
    //2.设置标题
//    contactVc.navigationItem.title  = [NSString stringWithFormat:@"%@的联系人列表",self.accountField.text];
    contactVc.title = [NSString stringWithFormat:@"%@的联系人列表",self.accountField.text];
    
}

@end
