//
//  PrivacyViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/15.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "PrivacyViewController.h"

@interface PrivacyViewController ()

@property (weak, nonatomic) IBOutlet UISwitch * switch1;
@property (weak, nonatomic) IBOutlet UISwitch * switch2;
@property (weak, nonatomic) IBOutlet UISwitch * switch3;
@property (weak, nonatomic) IBOutlet UISwitch * switch4;


-(void)button1;
-(void )button2;
-(void)button3;
-(void)button4;


@end

@implementation PrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"权限与隐私";

    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;
    
    UIButton *  btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0,84,320,44)];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(button1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *  btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0,143,320,44)];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(button2) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *  btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0,190,320,44)];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(button3) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *  btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0,202,320,44)];
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(button4) forControlEvents:UIControlEventTouchUpInside];
   
    
     [_switch1 setOn:NO animated:YES];
     [_switch4 setOn:NO animated:YES];

}

-(void)button1
{

}

-(void)button2
{


}

-(void)button3
{


}

-(void)button4
{


}

@end
