//
//  MyWalletViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/13.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "MyWalletViewController.h"
#import "DZ_ScaleCircle.h"
#import "DZ_Line.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface MyWalletViewController ()
- (IBAction)back:(id)sender;


@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

        self.title = @"我的钱包";
        
        //背景图片
   // self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;
    [self setCircle1];
    [self setCircle2];  
}


//大圆
- (void)setCircle1{

    DZ_ScaleCircle *circle = [[DZ_ScaleCircle alloc] initWithFrame:CGRectMake(30, 56, kScreenWidth-60 ,  kScreenWidth-60)];
    
    //  四个区域的颜色
    circle.firstColor = [UIColor clearColor];
    circle.secondColor = [UIColor whiteColor];
    circle.thirdColor = [UIColor whiteColor];
    circle.fourthColor = [UIColor clearColor];
    //  四个区域所占的比例
    circle.firstScale = 0.3;
    circle.secondScale = 0.2;
    circle.thirdScale = 0.4;
    circle.fourthScale = 0.1;
    //  线宽
    circle.lineWith = 2;
    //  未填充颜色
    circle.unfillColor =[UIColor clearColor];
    //  动画时长
    circle.animation_time = 0.0;
    //  中心标签的显示数值
  //  circle.centerLable.text = @"";
    [self.view addSubview:circle];
}

//小圆
- (void)setCircle2{
    
    DZ_Line *circle1 = [[DZ_Line alloc] initWithFrame:CGRectMake(30, 46, kScreenWidth-60 ,  kScreenWidth-60)];
    
    //  四个区域的颜色
    circle1.firstColor = [UIColor clearColor];
    circle1.secondColor = [UIColor whiteColor];
    circle1.thirdColor = [UIColor whiteColor];
    circle1.fourthColor = [UIColor clearColor];
    //  四个区域所占的比例
    circle1.firstScale = 0.1;
    circle1.secondScale = 0.5;
    circle1.thirdScale = 0.3;
    circle1.fourthScale = 0.1;
    //  线宽
    circle1.lineWith = 2;
    //  未填充颜色
    circle1.unfillColor =[UIColor clearColor];
    //  动画时长
    circle1.animation_time = 0.0;
    //  中心标签的显示数值
    //  circle.centerLable.text = @"";
    [self.view addSubview:circle1];
}



- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
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
