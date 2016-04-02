//
//  FindPsdViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/9.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "FindPsdViewController.h"
#import "LoginViewController.h"

@interface FindPsdViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
-(IBAction)back;

@end

@implementation FindPsdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
