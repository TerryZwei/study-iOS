//
//  ViewController.m
//  iOS-通讯录
//
//  Created by terry on 15/11/14.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>

@interface ViewController ()
- (IBAction)accessAllPeople;
- (IBAction)updatePeople;
- (IBAction)addPeople;

@end
//凡是函数名中包办了create、retain、copy、new、等字眼，创建的数据类型，最终毒药release
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestAccessBook];
}

//请求访问
- (void) requestAccessBook
{
    //创建通讯录实例
    ABAddressBookRef book = ABAddressBookCreateWithOptions(NULL, NULL);
    
    //请求访问通讯录的权限
    ABAddressBookRequestAccessWithCompletion(book, ^(bool granted, CFErrorRef error) {
        if (granted) {
            NSLog(@"授权成功");
        }else{
            NSLog(@"授权失败");
        }
    });
    
    //释放资源 Core Foundation
    CFRelease(book);
}


- (IBAction)accessAllPeople {
    if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) return;
    //创建通讯录实例
    ABAddressBookRef book = ABAddressBookCreateWithOptions(NULL, NULL);
    
    //获取通讯录中所有的联系人
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(book);
    
    //遍历数组中的所有联系人
    CFIndex count = CFArrayGetCount(allPeople);
    for (int i = 0; i<count; i++) {
        //获得这个位置对应的联系人
        ABRecordRef people = CFArrayGetValueAtIndex(allPeople, i);
        //获得联系人的信息
        CFStringRef name = ABRecordCopyValue(people, kABPersonFirstNameProperty);
        ABMultiValueRef mobile = ABRecordCopyValue(people, kABPersonPhoneProperty);
        
        
        CFArrayRef phone = ABMultiValueCopyArrayOfAllValues(mobile);
        int phoneCount = CFArrayGetCount(phone);
        for (int j = 0; j<phoneCount; j++) {
            CFStringRef phonestr= ABMultiValueCopyValueAtIndex(mobile, j);
            NSLog(@"%@", phonestr);
        }
        
        NSLog(@"%@",name);
        //释放
        CFRelease(name);
        CFRelease(mobile);
    }
    
    //释放
    CFRelease(allPeople);
    CFRelease(book);

}

- (IBAction)updatePeople {
}

- (IBAction)addPeople {
}
@end
