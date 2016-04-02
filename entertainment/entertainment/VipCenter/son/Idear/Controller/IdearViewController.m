//
//  IdearViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/13.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "IdearViewController.h"


@interface IdearViewController ()

@property (weak, nonatomic) IBOutlet UITextField * text1;
@property (weak, nonatomic) IBOutlet UITextView * text2;

@end

@implementation IdearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"意见反馈";

    //背景图片
    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;

}





//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.text1 resignFirstResponder];
    [self.text2 resignFirstResponder];

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
