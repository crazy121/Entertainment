//
//  SelectRasingViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/8.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "SelectRasingViewController.h"
#import "SupportViewController.h"
#import "StockInvestViewController.h"

@interface SelectRasingViewController ()

@end

@implementation SelectRasingViewController

- (IBAction)buttonClicked:(UIButton *)sender {
    if (sender.tag == 101) {
        StockInvestViewController *stockVC = [[StockInvestViewController alloc] init];
        [self.navigationController pushViewController:stockVC animated:YES];
    } else {
        SupportViewController *supportVC = [[SupportViewController alloc] init];
        [self.navigationController pushViewController:supportVC animated:YES];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"支持";
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

@end
