//
//  ProjectViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/3.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectTableViewCell.h"
#import "ConcertViewController.h"

static NSString *identifier = @"MyCell";

@interface ProjectViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"演唱会";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProjectTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    UIBarButtonItem *categoryButton = [[UIBarButtonItem alloc] init];
    [categoryButton setTitle:@"分类"];
    self.navigationItem.rightBarButtonItem = categoryButton;
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

#pragma mark - UITableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectTableViewCell *cell = (ProjectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"热门演唱会";
    } else {
        return @"最新演唱会";
    }
}


#pragma mark - UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ConcertViewController *concertVC = [[ConcertViewController alloc] init];
    [self.navigationController pushViewController:concertVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

@end
