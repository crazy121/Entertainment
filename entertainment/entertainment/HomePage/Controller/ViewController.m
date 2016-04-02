//
//  ViewController.m
//  entertainment
//
//  Created by Metallic  on 16/2/24.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "ViewController.h"
#import "IntroCollectionViewCell.h"
#import "ShowViewController.h"
#import "ProjectViewController.h"
#import "ShowAllViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kImageCount 5

static NSString *identifier = @"MyCell";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate,  UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;//上下滑动的窗口
@property (nonatomic, strong) UIScrollView *adverScrollView;//广告位轮播
@property (nonatomic, strong) UIPageControl *pageControl;//广告翻页
@property (nonatomic, strong) NSTimer *timer;//广告轮播计时器
@property (nonatomic, strong) UICollectionView *recentCV;//最近上线
@property (nonatomic, strong) UICollectionView *sceneCV;//热门现场
@property (nonatomic, strong) UICollectionView *videoCV;//热门影视
@property (weak, nonatomic) IBOutlet UIBarButtonItem *categoryButton;//导航栏分类按钮
@property (nonatomic, strong) UITableView *categoryTV;//分类菜单
@property (nonatomic, assign) BOOL categorySelected;//分类菜单是否被选中
@property (nonatomic, strong) UIButton *coverButton;//遮盖视图
@property (nonatomic, strong) NSArray *categoryArray;//分类数组
@property (nonatomic, strong) NSArray *movieArray;//电影数组
@property (nonatomic, strong) NSArray *concertArray;//演唱会数组
@property (nonatomic, strong) NSArray *tvArray;//电视剧数组
@end

@implementation ViewController
#pragma mark - setters and getters
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight)];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (UIScrollView *)adverScrollView
{
    if (!_adverScrollView) {
        _adverScrollView = [[UIScrollView alloc] init];
        _adverScrollView.frame = CGRectMake(0, 0, kScreenWidth, 150);
        _adverScrollView.backgroundColor = [UIColor whiteColor];
        _adverScrollView.showsHorizontalScrollIndicator = NO;
        _adverScrollView.delegate = self;
        _adverScrollView.pagingEnabled = YES;
    }
    return _adverScrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}

- (UICollectionView *)recentCV
{
    if (!_recentCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 120);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
        //初始化collectionView
        _recentCV = [self createCollectionWithFrame:_recentCV.frame andFlowLayout:layout];
    }
    return _recentCV;
}

- (UICollectionView *)sceneCV
{
    if (!_sceneCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScreenWidth / 3, 90);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
        //初始化collectionView
        _sceneCV = [self createCollectionWithFrame:_sceneCV.frame andFlowLayout:layout];
    }
    return _sceneCV;
}

- (UICollectionView *)videoCV
{
    if (!_videoCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 120);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
        //初始化collectionView
        _videoCV = [self createCollectionWithFrame:_videoCV.frame andFlowLayout:layout];
    }
    return _videoCV;
}

- (UICollectionView *)createCollectionWithFrame:(CGRect)frame andFlowLayout:(UICollectionViewFlowLayout *)layout
{
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[IntroCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsHorizontalScrollIndicator = NO;
    return collectionView;
}

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

- (NSArray *)categoryArray
{
    if (!_categoryArray) {
        _categoryArray = [[NSArray alloc] init];
        _categoryArray = @[@"演唱会", @"剧场", @"电影", @"电视剧", @"其它"];
    }
    return _categoryArray;
}

- (NSArray *)movieArray
{
    if (!_movieArray) {
        _movieArray = [[NSArray alloc] init];
        _movieArray = @[@"一念天堂", @"变形金刚3", @"不可思议", @"绝地武士3", @"寻龙决"];
    }
    return _movieArray;
}

- (NSArray *)concertArray
{
    if (!_concertArray) {
        _concertArray = [[NSArray alloc] init];
        _concertArray = @[@"群星演唱会", @"杨坤演唱会", @"李宇春演唱会", @"张信哲演唱会", @"live show"];
    }
    return _concertArray;
}

- (NSArray *)tvArray
{
    if (!_tvArray) {
        _tvArray = [[NSArray alloc] init];
        _tvArray = @[@"火线", @"strike back", @"破产姐妹", @"权力的游戏", @"six feet"];
    }
    return _tvArray;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.scrollView];
    //广告轮播
    [self.scrollView addSubview:self.adverScrollView];
    self.adverScrollView.contentSize = CGSizeMake(self.adverScrollView.bounds.size.width * kImageCount, 0);
    [self addAdvertisementToAdverScrollView];
    //pageControl
    self.pageControl.numberOfPages = kImageCount;
    self.pageControl.frame = CGRectMake((kScreenWidth - 100) / 2, self.adverScrollView.frame.origin.y + self.adverScrollView.bounds.size.height - 20, 100, 20);
    [self.scrollView addSubview:self.pageControl];
    [self addAdverTimer];
    //创建下部分视图
    [self createDownSideView];
}

- (void)addAdvertisementToAdverScrollView
{
    for (int i = 1; i <= kImageCount; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"photo_%d", i]];
        imageView.frame = CGRectMake((i - 1) * self.adverScrollView.bounds.size.width                   , 0, self.scrollView.bounds.size.width, self.adverScrollView.bounds.size.height);
        [self.adverScrollView addSubview:imageView];
    }
}

- (void)addAdverTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2
                                                  target:self
                                                selector:@selector(nextAdvertisement)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)nextAdvertisement
{
    NSInteger page = self.pageControl.currentPage;
    if (page == 4) {
        page = 0;
    } else {
        page ++;
    }
    CGFloat x = page * self.adverScrollView.bounds.size.width;
    self.adverScrollView.contentOffset = CGPointMake(x, 0);
}

- (void)createDownSideView
{
    //提示栏1:最近上线
    NSString *tipStr1 = @"最新众筹";
    CGRect frameOfView1 = CGRectMake(0, self.adverScrollView.bounds.size.height, 0, 0);
    UIView *view1 = [self createTipViewWithFrame:frameOfView1 andTipText:tipStr1];
    [self.scrollView addSubview:view1];
    //演出展示
    CGRect frameOfRecentCV = CGRectMake(0, frameOfView1.origin.y + view1.bounds.size.height + 8, kScreenWidth, 120);
    self.recentCV.frame = frameOfRecentCV;
    [self.scrollView addSubview:self.recentCV];
    //分割线1
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(8, self.recentCV.frame.origin.y + self.recentCV.bounds.size.height + 8, kScreenWidth - 8, 1)];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    lineView1.alpha = 0.5;
    [self.scrollView addSubview:lineView1];
    
    //提示栏2:热门现场
    NSString *tipStr2 = @"演唱会众筹";
    CGRect frameOfView2 = CGRectMake(0, lineView1.frame.origin.y + lineView1.bounds.size.height, 0, 0);
    UIView *view2 = [self createTipViewWithFrame:frameOfView2 andTipText:tipStr2];
    [self.scrollView addSubview:view2];
    //演出展示
    CGRect frameOfSceneCV = CGRectMake(0, frameOfView2.origin.y + view2.bounds.size.height + 8, kScreenWidth, 90);
    self.sceneCV.frame = frameOfSceneCV;
    [self.scrollView addSubview:self.sceneCV];
    //分割线2
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(8, self.sceneCV.frame.origin.y + self.sceneCV.bounds.size.height + 8, kScreenWidth - 8, 1)];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    lineView2.alpha = 0.5;
    [self.scrollView addSubview:lineView2];
    
    //提示栏3:热门影视
    NSString *tipStr3 = @"影视众筹";
    CGRect frameOfView3 = CGRectMake(0, lineView2.frame.origin.y + lineView2.bounds.size.height, 0, 0);
    UIView *view3 = [self createTipViewWithFrame:frameOfView3 andTipText:tipStr3];
    [self.scrollView addSubview:view3];
    //影视展示
    CGRect frameOfVideoCV = CGRectMake(0, frameOfView3.origin.y + view3.bounds.size.height + 8, kScreenWidth, 120);
    self.videoCV.frame = frameOfVideoCV;
    [self.scrollView addSubview:self.videoCV];
    
    //分类菜单
    self.categoryTV.frame = CGRectMake(- kScreenWidth / 2, 64, kScreenWidth / 2, kScreenHeight);
    [self.view addSubview:self.categoryTV];
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, self.videoCV.frame.origin.y + self.videoCV.bounds.size.height + 130);
}

/**
 *  创建提示视图通用方法
 *
 *  @param frame  提示视图的位置
 *  @param text  提示视图标题
 *
 *  @return 封装好的提示试图
 */
- (UIView *)createTipViewWithFrame:(CGRect)frame andTipText:(NSString *)text
{
    UIView *tipView = [[UIView alloc] init];
    
    //左边label
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    CGSize labelSize = [label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font, NSFontAttributeName, nil]];
    label.frame = CGRectMake(8, 8, labelSize.width, labelSize.height);
    [tipView addSubview:label];
    //右边button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"显示全部" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.098 green:0.098 blue:0.098 alpha:1.0] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    CGSize buttonSize = [button.titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:button.titleLabel.font, NSFontAttributeName,  nil]];
    button.frame = CGRectMake(kScreenWidth - 8 - buttonSize.width, label.frame.origin.y + (labelSize.height - buttonSize.height), buttonSize.width, buttonSize.height);
    [tipView addSubview:button];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    //tipView的frame
    tipView.frame = CGRectMake(0, frame.origin.y, kScreenWidth, labelSize.height + 8);
    
    return tipView;
}

- (void)buttonClicked
{
    ShowAllViewController *showAllVC = [[ShowAllViewController alloc] init];
    [self.navigationController pushViewController:showAllVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
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

#pragma mark - UIScrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == self.adverScrollView) {
        [self.timer invalidate];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.adverScrollView) {
        CGFloat scrollViewW = scrollView.frame.size.width;
        CGFloat x = scrollView.contentOffset.x;
        int page = (x + scrollViewW / 2) / scrollViewW;
        self.pageControl.currentPage = page;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView == self.adverScrollView) {
        [self addAdverTimer];
    }
}

#pragma mark - UICollectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IntroCollectionViewCell *cell = (IntroCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (collectionView == self.recentCV) {
        [cell updateUIWithImage:[NSString stringWithFormat:@"movie_%ld", (long)indexPath.item] andTitle:self.movieArray[indexPath.row]];
    } else if (collectionView == self.sceneCV) {
        [cell updateUIWithImage:[NSString stringWithFormat:@"concert_%ld", (long)indexPath.item] andTitle:self.concertArray[indexPath.row]];
    } else {
        [cell updateUIWithImage:[NSString stringWithFormat:@"tv_%ld", (long)indexPath.item] andTitle:self.tvArray[indexPath.row]];
    }
    
    return cell;
}

#pragma mark - UICollectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShowViewController *showVC = [[ShowViewController alloc] init];
    [self.navigationController pushViewController:showVC animated:YES];
}

#pragma mark - UITableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.categoryArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    cell.textLabel.textColor = [UIColor colorWithRed:0.1843 green:0.5137 blue:0.9804 alpha:1.0];
    return cell;
}

#pragma mark - UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ProjectViewController *projectVC = [[ProjectViewController alloc] init];
    [self.navigationController pushViewController:projectVC animated:YES];
}
@end
