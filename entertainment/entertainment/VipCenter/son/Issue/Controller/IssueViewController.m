//
//  IssueViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 16/3/6.
//  Copyright © 2016年 太乙奇门. All rights reserved.
//

#import "IssueViewController.h"

@interface IssueViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scoreView;
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (weak, nonatomic) IBOutlet UITextField *text3;
@property (weak, nonatomic) IBOutlet UITextField *text4;
@property (weak, nonatomic) IBOutlet UITextField *text5;
@property (weak, nonatomic) IBOutlet UITextField *text6;
@property (weak, nonatomic) IBOutlet UITextField *text7;


@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"项目信息";

    self.scoreView.pagingEnabled=YES;//是否自己动适应
    self.scoreView .userInteractionEnabled = YES;
    self.scoreView.bounces = NO;

    
    self.scoreView.delegate =self;
    
    //点击屏幕空白处去掉键盘
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];
    [recognizer setNumberOfTapsRequired:1];
    [recognizer setNumberOfTouchesRequired:1];
    [self.scoreView addGestureRecognizer:recognizer];

    

}

- (void)touchScrollView
{
    [self.text1 resignFirstResponder];
    [self.text2 resignFirstResponder];
    [self.text3 resignFirstResponder];
    [self.text4 resignFirstResponder];
    [self.text5 resignFirstResponder];
    [self.text6 resignFirstResponder];
    [self.text7 resignFirstResponder];
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
    
    
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
