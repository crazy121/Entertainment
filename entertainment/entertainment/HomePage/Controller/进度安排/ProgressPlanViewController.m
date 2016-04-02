//
//  ProgressPlanViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/9.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "ProgressPlanViewController.h"

@interface ProgressPlanViewController ()

@end

@implementation ProgressPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"进度安排";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


@end
