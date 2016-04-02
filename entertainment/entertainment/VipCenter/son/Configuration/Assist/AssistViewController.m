//
//  AssistViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/16.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "AssistViewController.h"

@interface AssistViewController ()

@property (weak, nonatomic) IBOutlet UISwitch * switch6;

@end

@implementation AssistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"辅助功能";
  

    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;

       [_switch6 setOn:NO animated:YES];
    
    
    
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
