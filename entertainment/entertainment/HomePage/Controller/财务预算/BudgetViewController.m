//
//  BudgetViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/9.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "BudgetViewController.h"

@interface BudgetViewController ()

@end

@implementation BudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}



@end
