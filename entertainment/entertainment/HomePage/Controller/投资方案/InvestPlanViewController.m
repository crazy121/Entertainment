//
//  InvestPlanViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/9.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "InvestPlanViewController.h"

@interface InvestPlanViewController ()

@end

@implementation InvestPlanViewController

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
