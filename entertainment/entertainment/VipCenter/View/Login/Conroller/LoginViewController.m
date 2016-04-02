//
//  LoginViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/8.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisViewController.h"
#import "FindPsdViewController.h"
#import "TYVipCenterViewController.h"

@interface LoginViewController ()

@property(nonatomic,weak)IBOutlet UIImageView * myLogo;
@property(nonatomic,weak)IBOutlet UIButton * loginButton ;
@property(nonatomic,weak)IBOutlet UIButton * regisButton;
@property(nonatomic,weak)IBOutlet UIButton * fogetButton;
@property(nonatomic,weak)IBOutlet  UITextField * usename;
@property(nonatomic,weak)IBOutlet  UITextField * passWord;
@property(nonatomic,weak)IBOutlet UIButton * backToHome ;

-(IBAction)login;
-(IBAction)regis;
-(IBAction)foget;
-(IBAction)backToHomePage;

@end





@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = YES;
    /**
     点击空白处隐藏键盘
     */
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    

}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.usename resignFirstResponder];
        [self.passWord resignFirstResponder];
}


//页面跳转
//1.点击登陆按钮，显示登录成功
-(IBAction)login
{
    if ([_usename.text isEqual:@"123456"]&&[_passWord.text isEqual:@"123456"]) {
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];

        [self.view endEditing:YES];
        
        NSNotification *notification = [[NSNotification alloc] initWithName:@"UsernameChagedNotification" object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"123456", @"username", nil]];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

//2.点击注册按钮，进入注册页面
-(IBAction)regis
{
    RegisViewController *regis = [[RegisViewController alloc] init];
    [self.navigationController pushViewController:regis animated:YES];

}

//3.点击忘记密码，进入找回密码界面
-(IBAction)foget
{
     {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"忘记密码？" message:@"是否需要找回密码？" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"找回密码" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            FindPsdViewController *find = [[FindPsdViewController alloc] init];
            [self.navigationController pushViewController:find animated:YES];
        }]];
        
        [self presentViewController:alert animated:YES completion:NULL];
    }

}


//点击箭头，返回主页
-(IBAction)backToHomePage
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES  animated:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
