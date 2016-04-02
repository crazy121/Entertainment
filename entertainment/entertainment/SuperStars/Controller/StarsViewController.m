//
//  StarsViewController.m
//  entertainment
//
//  Created by Metallic  on 16/2/27.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "StarsViewController.h"
#import "StarsView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kStarsViewWidth 74
#define kStarsViewHeight 120

static NSString *identifier = @"MyCell";

@interface StarsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *categoryButton;//导航栏分类按钮
@property (nonatomic, strong) UITableView *categoryTV;//分类菜单
@property (nonatomic, assign) BOOL categorySelected;//分类菜单是否被选中
@property (nonatomic, strong) UIButton *coverButton;//遮盖视图
@property (nonatomic, strong) NSArray *personArray;//明星分类数组
@property (weak, nonatomic) IBOutlet UIView *lineView;
@end

@implementation StarsViewController
#pragma mark - setters and getters
- (UITableView *)categoryTV
{
    if (!_categoryTV) {
        _categoryTV = [[UITableView alloc] init];
        [_categoryTV registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
        _categoryTV.dataSource = self;
        _categoryTV.delegate = self;
        _categoryTV.alpha = 0.98;
    }
    return _categoryTV;
}

- (UIButton *)coverButton
{
    if (!_coverButton) {
        _coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_coverButton addTarget:self action:@selector(categoryTableViewStateChanged) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverButton;
}

- (NSArray *)personArray
{
    if (!_personArray) {
        _personArray = [[NSArray alloc] init];
        _personArray = @[@"歌手", @"演员", @"主持人", @"音乐人", @"其它"];
    }
    return _personArray;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = [self.lineView convertRect:self.lineView.bounds toView:self.view];
    
    CGRect frame1 = CGRectMake(0, rect.origin.y + self.lineView.bounds.size.height, kStarsViewWidth, kStarsViewHeight);
    [self createShowStarsViewWithFrame:frame1];
    
    CGRect frame2 = CGRectMake(0, frame1.origin.y + frame1.size.height, kStarsViewWidth, kStarsViewHeight);
    [self createShowStarsViewWithFrame:frame2];
    
    //分类菜单
    self.categoryTV.frame = CGRectMake(- kScreenWidth / 2, 64, kScreenWidth / 2, kScreenHeight);
    [self.view addSubview:self.categoryTV];
}


- (void)createShowStarsViewWithFrame:(CGRect)frame
{
    for (int i = 0; i < 4; i ++) {
        StarsView *starsView = [StarsView makeStarsView];
        starsView.frame = CGRectMake((kStarsViewWidth + 8) * i, frame.origin.y, kStarsViewWidth, kStarsViewHeight);
        [self.view addSubview:starsView];
    }
}


#pragma mark - IBOutlet Action

- (IBAction)cotegoryBtnClicked
{
    [self categoryTableViewStateChanged];
}

/**
 *  点击分类按钮，遮盖视图触发的事件
 */
- (void)categoryTableViewStateChanged
{
    if (!self.categorySelected) {
        self.categoryTV.layer.shadowColor = [UIColor blackColor].CGColor;
        self.categoryTV.layer.shadowOffset = CGSizeMake(3, 0);
        self.categoryTV.layer.shadowOpacity = 0.6;
        self.categoryTV.layer.shadowRadius = 3.0;
        self.categoryTV.clipsToBounds = NO;
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.categoryTV.frame = CGRectMake(0, 64, kScreenWidth / 2, kScreenHeight);
                         } completion:^(BOOL finished) {
                             [self.categoryButton setTitle:@"取消"];
                             self.categorySelected = !self.categorySelected;
                             self.coverButton.frame = CGRectMake(self.categoryTV.bounds.size.width, 64, kScreenWidth / 2, kScreenHeight);
                             [self.view addSubview:self.coverButton];
                         }];
    } else {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.categoryTV.frame = CGRectMake(- kScreenWidth / 2, 64, kScreenWidth / 2, kScreenHeight);
                         } completion:^(BOOL finished) {
                             [self.categoryButton setTitle:@"分类"];
                             self.categorySelected = !self.categorySelected;
                             [self.coverButton removeFromSuperview];
                         }];
        self.categoryTV.clipsToBounds = YES;
    }
}

#pragma mark - UITableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.personArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    cell.textLabel.textColor = [UIColor colorWithRed:0.1843 green:0.5137 blue:0.9804 alpha:1.0];
    return cell;
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTV) {
        return 44;
    } else {
        return 60;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
