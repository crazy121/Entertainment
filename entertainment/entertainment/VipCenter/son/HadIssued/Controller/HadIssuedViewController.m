//
//  HadIssuedViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/13.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "HadIssuedViewController.h"
#import "HadIssuedTableViewCell.h"


static NSString *identifier = @"CircleCell";

@interface HadIssuedViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *HadIssuedView;




@end

@implementation HadIssuedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"已发布需求";
    
    [self.HadIssuedView registerNib:[UINib nibWithNibName:@"HadIssuedTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    //背景图片
    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;
            self.HadIssuedView.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
        
    //导航栏右侧添加加号按钮



}





#pragma mark - TableView DateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HadIssuedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HadIssuedTableViewCell alloc] init];
    }
    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 99;
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
