//
//  StockInvestViewController.m
//  Flying
//
//  Created by Metallic  on 15/12/24.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "StockInvestViewController.h"
#import "RingView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface StockInvestViewController ()

@property (nonatomic, strong) UITextField *moneyField;
@property (nonatomic, strong) UITextField *stockField;
@property (nonatomic, strong) RingView *ringView;

@end

@implementation StockInvestViewController
{
    UIControl *_coverView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.9271 green:0.9271 blue:0.9271 alpha:1.0];
    
    //上部的UIView
    UIView *upSideView = [[UIView alloc] initWithFrame:CGRectMake(8, 64, kScreenWidth - 16, kScreenHeight / 3)];
    upSideView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:upSideView];
    
    //金额输入框
    _moneyField = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, kScreenWidth - 80, 30)];
    _moneyField.borderStyle = UITextBorderStyleRoundedRect;
    _moneyField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _moneyField.keyboardType = UIKeyboardTypeNumberPad;
    
    UIImageView *moneyImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FontAwesome_f157(1)_24(1)"]];
    _moneyField.leftView = moneyImage;
    _moneyField.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    moneyLabel.text = @"RMB";
    moneyLabel.font = [UIFont fontWithName:@"Arial" size:12];
    _moneyField.rightView = moneyLabel;
    _moneyField.rightViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_moneyField];
    
    //股份输入框
    _stockField = [[UITextField alloc] initWithFrame:CGRectMake(40, 100 + 21 + 30, kScreenWidth - 80, 30)];
    _stockField.borderStyle = UITextBorderStyleRoundedRect;
    _stockField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _stockField.keyboardType = UIKeyboardTypeNumberPad;
    
    UIImageView *stockImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"linecons_e020(0)_24(1)"]];
    _stockField.leftView = stockImage;
    _stockField.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *stockLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
    stockLabel.text = @"%";
    stockLabel.font = [UIFont fontWithName:@"Arial" size:12];
    _stockField.rightView = stockLabel;
    _stockField.rightViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_stockField];
    
    //认购预约按钮
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = CGRectMake(kScreenWidth - 40 - 60, _stockField.frame.origin.y + _stockField.frame.size.height + 21, 60, 21);
    [buyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buyBtn setTitle:@"认购预约" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    buyBtn.layer.borderWidth = 1;
    buyBtn.layer.cornerRadius = 10;
    [self.view addSubview:buyBtn];
    [buyBtn addTarget:self action:@selector(buyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //下部的UIView
    UIView *downSideView = [[UIView alloc] initWithFrame:CGRectMake(8, 64 + upSideView.bounds.size.height + 42, kScreenWidth - 16, kScreenHeight - 64 - upSideView.bounds.size.height - 42 - 21)];
    downSideView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downSideView];
    
    //环形百分比
    _ringView = [[RingView alloc] initWithFrame:CGRectMake(21, downSideView.frame.origin.y + 21, 200, 200)];
    _ringView.arcFinishColor = [UIColor redColor];
    _ringView.arcUnfinishColor = [UIColor lightGrayColor];
    _ringView.arcBackColor = [UIColor orangeColor];
    _ringView.percent = 0.2;
    _ringView.width = 40;
    [self.view addSubview:_ringView];
    
    //对环形的一些说明
    UILabel *percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(_ringView.frame.origin.x + _ringView.frame.size.width + 8, _ringView.frame.origin.y + 60, 70, 10)];
    percentLabel.text = @"%  未认购股份";
    percentLabel.font = [UIFont fontWithName:@"Arial" size:10];
    [self.view addSubview:percentLabel];
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(percentLabel.frame.origin.x, percentLabel.frame.origin.y + percentLabel.frame.size.height + 21, 10, 10)];
    grayView.backgroundColor = [UIColor lightGrayColor];
    grayView.layer.cornerRadius = 5;
    [self.view addSubview:grayView];
    
    UILabel *canbuyedLabel = [[UILabel alloc] initWithFrame:CGRectMake(grayView.frame.origin.x + grayView.frame.size.width + 4, grayView.frame.origin.y, 70, 10)];
    canbuyedLabel.text = @"未认购股份";
    canbuyedLabel.font = [UIFont fontWithName:@"Arial" size:10];
    [self.view addSubview:canbuyedLabel];
    
    UIView *orangeView = [[UIView alloc] initWithFrame:CGRectMake(grayView.frame.origin.x, grayView.frame.origin.y + grayView.frame.size.height + 21, 10, 10)];
    orangeView.backgroundColor = [UIColor orangeColor];
    orangeView.layer.cornerRadius = 5;
    [self.view addSubview:orangeView];
    
    UILabel *cannotbuyedLabel = [[UILabel alloc] initWithFrame:CGRectMake(orangeView.frame.origin.x + orangeView.frame.size.width + 4, orangeView.frame.origin.y, 70, 10)];
    cannotbuyedLabel.text = @"已认购股份";
    cannotbuyedLabel.font = [UIFont fontWithName:@"Arial" size:10];
    [self.view addSubview:cannotbuyedLabel];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)buyBtnClick
{
    self.ringView.percent = 0.5;
}

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
