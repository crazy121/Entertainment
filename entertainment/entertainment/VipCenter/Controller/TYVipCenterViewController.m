//
//  TYVipCenterViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 16/3/4.
//  Copyright © 2016年 太乙奇门. All rights reserved.
//

#import "TYVipCenterViewController.h"
#import "ProfileViewController.h"
#import "IssueViewController.h"
#import "HadIssuedViewController.h"
#import "MyWalletViewController.h"
#import "MyCollectViewController.h"
#import "AboutUsViewController.h"
#import "ConfigurationViewController.h"
#import "IdearViewController.h"
#import "LoginViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define StretchHeaderHeight 200

@interface TYVipCenterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backGroud;
@property (weak, nonatomic) IBOutlet UILabel *myName;
@property (weak, nonatomic) IBOutlet UIButton *myLogo;

- (IBAction)clickMyLogo;
- (IBAction)clickIssue;
-(IBAction)clickHadIssued;
- (IBAction)clickMyWallet;
- (IBAction)clickMyCollet;
- (IBAction)clickMyIdear;
- (IBAction)clickAboutUs;
- (IBAction)clickConfiguration;
- (IBAction)clickExit;
@end

@implementation TYVipCenterViewController
{
    UIControl *_coverView;//遮盖视图
    UIView *chooseView;//点击退出弹出的小视图
    UILabel *_label;
    UIButton *_loginButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    //创建遮盖视图
    _coverView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight )];
    _coverView.backgroundColor = [UIColor grayColor];
    _coverView.alpha = 0.5;
    [self.view addSubview:_coverView];
    _coverView.hidden = YES;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(usernameChaged:) name:@"UsernameChagedNotification" object:nil];
}

- (void)usernameChaged:(NSNotification *)notification
{
    self.myName.hidden=NO;
    self.myLogo.hidden=NO;
    self.myName.text = [notification.userInfo objectForKey:@"username"];
    _label.hidden = YES;
    _loginButton.hidden = YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

/**
点击我的头像进去个人信息设置
 */
-(IBAction)clickMyLogo
{
    
    ProfileViewController *profileVC=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:profileVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;


}

/**
 点击发布众筹
 */
- (IBAction)clickIssue
{

    IssueViewController *issueVC=[[IssueViewController alloc]init];
    [self.navigationController pushViewController:issueVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}



/**
 点击已发布众筹
 */
-(IBAction)clickHadIssued
{
    HadIssuedViewController *hadissuedVC=[[HadIssuedViewController alloc]init];
    [self.navigationController pushViewController:hadissuedVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}

//点击我的钱包
- (IBAction)clickMyWallet
{
    MyWalletViewController *walletVC=[[MyWalletViewController alloc]init];
    [self.navigationController pushViewController:walletVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}

//点击我的收藏
- (IBAction)clickMyCollet
{
    MyCollectViewController *colletVC=[[MyCollectViewController alloc]init];
    [self.navigationController pushViewController:colletVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}

//点击我的建议
- (IBAction)clickMyIdear
{
    IdearViewController *idearVC=[[IdearViewController alloc]init];
    [self.navigationController pushViewController:idearVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}

//点击关于我们
- (IBAction)clickAboutUs
{
    AboutUsViewController *aboutusVC=[[AboutUsViewController alloc]init];
    [self.navigationController pushViewController:aboutusVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}

//点击设置
- (IBAction)clickConfiguration
{
    ConfigurationViewController *configurationVC=[[ConfigurationViewController alloc]init];
    [self.navigationController pushViewController:configurationVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;

}

//点击退出
- (IBAction)clickExit
{
    
    _coverView.hidden = NO;
    //点击弹出UIView小页面
    chooseView=[[UIView alloc]initWithFrame:CGRectMake(40, 150, 240, 150)];
    
    chooseView.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    chooseView.layer.cornerRadius = 15;
    
    UILabel *project =[[UILabel alloc]initWithFrame:CGRectMake(30, 40,200, 20)];
    project.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    project.text=@" 你真的要退出登陆吗？";
    
    //取消按钮
    UIButton *cancelButton=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 50, 40)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    //确定按钮
    UIButton *certainButton=[[UIButton alloc]initWithFrame:CGRectMake(170, 80, 50, 40)];
    [certainButton setTitle:@"确定" forState:UIControlStateNormal];
    [certainButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [certainButton addTarget:self action:@selector(certain) forControlEvents:UIControlEventTouchUpInside];

    [chooseView addSubview:project];
    [chooseView addSubview:cancelButton];
    [chooseView addSubview:certainButton];
    [self.view addSubview:chooseView];
}

/**
 点击取消按钮
 */
-(void)cancel
{
    _coverView.hidden = YES;
    chooseView.hidden=YES;
}

/**
 点击确定按钮
 */
-(void)certain
{
    self.myName.text = nil;
    _coverView.hidden = YES;
    chooseView.hidden=YES;
    
    self.myName.hidden=YES;
    self.myLogo.hidden=YES;

    
    _label =[[UILabel alloc]initWithFrame:CGRectMake(40, 60,240, 20)];
    _label.textColor=[UIColor whiteColor];
    _label.text=@" 你还没有登陆哦，赶快登陆吧";
    

    [self.backGroud addSubview:_label];
    //马上登陆按钮
    _loginButton=[[UIButton alloc]initWithFrame:CGRectMake(120, 100, 80, 40)];
    [_loginButton setTitle:@"马上登陆" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor whiteColor] ];
    _loginButton.alpha = 0.5;
    _loginButton.layer.cornerRadius = 10;
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backGroud setUserInteractionEnabled:YES];//使添加其上的button有点击事件
    [self.backGroud addSubview:_loginButton];
}


//点击马上登陆按钮，跳转到登陆界面
-(void)login
{
    LoginViewController *loginVC=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
