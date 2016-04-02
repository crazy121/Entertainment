//
//  ConcertViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/4.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "ConcertViewController.h"
#import "IntroCollectionViewCell.h"
#import "VideoViewController.h"
#import "SelectRasingViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kLineViewHeight 0.5

static NSString *identifier = @"MyCell";

@interface ConcertViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *concertImageView;
@property (nonatomic, strong) UILabel *concertLabel;
@property (nonatomic, strong) UILabel *placeLabel;
@property (nonatomic, strong) UILabel *guestLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UICollectionView *videoCollectionView;
@end

@implementation ConcertViewController
#pragma mark - setters and getters
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UIImageView *)concertImageView
{
    if (!_concertImageView) {
        _concertImageView = [[UIImageView alloc] init];
    }
    return _concertImageView;
}

- (UILabel *)concertLabel
{
    if (!_concertLabel) {
        _concertLabel = [[UILabel alloc] init];
    }
    return _concertLabel;
}

- (UILabel *)placeLabel
{
    if (!_placeLabel) {
        _placeLabel = [[UILabel alloc] init];
    }
    return _placeLabel;
}

- (UILabel *)guestLabel
{
    if (!_guestLabel) {
        _guestLabel = [[UILabel alloc] init];
    }
    return _guestLabel;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
    }
    return _dateLabel;
}

- (UILabel *)moneyLabel
{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] init];
    }
    return _moneyLabel;
}

- (UICollectionView *)videoCollectionView
{
    if (!_videoCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 120);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _videoCollectionView = [[UICollectionView alloc] initWithFrame:_videoCollectionView.frame collectionViewLayout:layout];
        _videoCollectionView.dataSource = self;
        _videoCollectionView.delegate = self;
        _videoCollectionView.backgroundColor = [UIColor whiteColor];
        _videoCollectionView.showsHorizontalScrollIndicator = NO;
        [_videoCollectionView registerClass:[IntroCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _videoCollectionView;
}


#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"众筹信息";
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:self.scrollView];
    //演唱会海报
    self.concertImageView.frame = CGRectMake(8, 8, kScreenWidth - 16, 150);
    self.concertImageView.image = [UIImage imageNamed:@"concert_1"];
    [self.scrollView addSubview:self.concertImageView];
    //演唱会名称
    self.concertLabel.text = @"杨坤北京演唱会";
    self.concertLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    CGSize concertLabelSize = [self.concertLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.concertLabel.frame = CGRectMake(8, self.concertImageView.frame.origin.y + self.concertImageView.bounds.size.height + 8, concertLabelSize.width, concertLabelSize.height);
    [self.scrollView addSubview:self.concertLabel];
    //演唱会举办地点
    self.placeLabel.text = @"举办地点: 北京万事达中心";
    self.placeLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    [self.placeLabel sizeToFit];
    self.placeLabel.frame = CGRectMake(8, self.concertLabel.frame.origin.y + self.concertLabel.bounds.size.height + 8, self.placeLabel.bounds.size.width, self.placeLabel.bounds.size.height);
    [self.scrollView addSubview:self.placeLabel];
    //到场嘉宾
    self.guestLabel.text = @"到场嘉宾: 那英，刘欢，汪峰，庾澄庆";
    self.guestLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    [self.guestLabel sizeToFit];
    self.guestLabel.frame = CGRectMake(8, self.placeLabel.frame.origin.y + self.placeLabel.bounds.size.height + 8, self.guestLabel.bounds.size.width, self.guestLabel.bounds.size.height);
    [self.scrollView addSubview:self.guestLabel];
    //发布日期
    self.dateLabel.text = @"发布日期: 2016年3月5日";
    self.dateLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    [self.dateLabel sizeToFit];
    self.dateLabel.frame = CGRectMake(8, self.guestLabel.frame.origin.y + self.guestLabel.bounds.size.height + 8, self.dateLabel.bounds.size.width, self.dateLabel.bounds.size.height);
    [self.scrollView addSubview:self.dateLabel];
    //lineView1
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = [UIColor grayColor];
    lineView1.alpha = 0.5;
    lineView1.frame = CGRectMake(8, self.dateLabel.frame.origin.y + self.dateLabel.bounds.size.height + 21, kScreenWidth - 8, kLineViewHeight);
    [self.scrollView addSubview:lineView1];
    //支持
    UIButton *supportButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [supportButton setTitle:@"支持它" forState:UIControlStateNormal];
    [supportButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [supportButton setBackgroundColor:[UIColor colorWithRed:0.0 green:0.502 blue:0.251 alpha:1.0]];
    supportButton.titleLabel.font = [UIFont systemFontOfSize:15];
    supportButton.showsTouchWhenHighlighted = YES;
    supportButton.layer.borderWidth = 1;
    supportButton.layer.borderColor = [UIColor blackColor].CGColor;
    supportButton.layer.cornerRadius = 5;
    supportButton.frame = CGRectMake(8, lineView1.frame.origin.y + 8, 100, 50);
    [supportButton addTarget:self action:@selector(supportBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:supportButton];
    //是否在众筹
    UILabel *audienceLabel = [[UILabel alloc] init];
    audienceLabel.text = @"正在进行众筹哦!";
    audienceLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    audienceLabel.textColor = [UIColor colorWithRed:0.251 green:0.502 blue:0.0 alpha:1.0];
    CGSize audienceLabelSize = [audienceLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    audienceLabel.frame = CGRectMake(supportButton.frame.origin.x + supportButton.bounds.size.width + 8, supportButton.frame.origin.y + 4, audienceLabelSize.width, audienceLabelSize.height);
    [self.scrollView addSubview:audienceLabel];
    //众筹情况
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"已经筹集528万，目标是1000万"];
    UIFont *attrFont = [UIFont boldSystemFontOfSize:15];
    UIColor *attrColor1 = [UIColor colorWithRed:0.4196 green:0.7922 blue:0.9765 alpha:1.0];
    UIColor *attrColor2 = [UIColor redColor];
    [attrString addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:attrFont, NSFontAttributeName, attrColor1, NSForegroundColorAttributeName, nil] range:NSMakeRange(4, 3)];
    [attrString addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:attrFont, NSFontAttributeName, attrColor2, NSForegroundColorAttributeName, nil] range:NSMakeRange(12, 4)];
    
    self.moneyLabel.attributedText = attrString;
    self.moneyLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.moneyLabel.numberOfLines = 0;
    self.moneyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize moneyLabelSize = [self.moneyLabel sizeThatFits:CGSizeMake(kScreenWidth - supportButton.frame.origin.x - supportButton.bounds.size.width - 10, MAXFLOAT)];
    self.moneyLabel.frame = CGRectMake(audienceLabel.frame.origin.x, audienceLabel.frame.origin.y + audienceLabel.bounds.size.height + 8, moneyLabelSize.width, moneyLabelSize.height);
    [self.scrollView addSubview:self.moneyLabel];
    //supportButton对齐
    supportButton.frame = CGRectMake(8, lineView1.frame.origin.y + 8, 100, self.moneyLabel.frame.origin.y + moneyLabelSize.height - audienceLabel.frame.origin.y + 4);
    //lineView2
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor grayColor];
    lineView2.alpha = 0.5;
    lineView2.frame = CGRectMake(8, self.moneyLabel.frame.origin.y + self.moneyLabel.bounds.size.height + 21, kScreenWidth - 8, kLineViewHeight);
    [self.scrollView addSubview:lineView2];
    //精彩MV
    UILabel *briefLabel = [[UILabel alloc] init];
    briefLabel.text = @"精彩MV";
    briefLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    CGSize briefLabelSize = [briefLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    briefLabel.frame = CGRectMake(8, lineView2.frame.origin.y + lineView2.bounds.size.height + 8, briefLabelSize.width, briefLabelSize.height);
    [self.scrollView addSubview:briefLabel];
    
    self.videoCollectionView.frame = CGRectMake(8, briefLabel.frame.origin.y + briefLabel.bounds.size.height + 4, kScreenWidth - 8, 120);
    [self.scrollView addSubview:self.videoCollectionView];
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, self.videoCollectionView.frame.origin.y + self.videoCollectionView.bounds.size.height + 21);
}

- (void)supportBtnClicked
{
    SelectRasingViewController *selectedVC = [[SelectRasingViewController alloc] init];
    [self.navigationController pushViewController:selectedVC animated:YES];
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

#pragma mark - UICollectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IntroCollectionViewCell *cell = (IntroCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell updateUIWithImage:@"movie_3" andTitle:@"杨坤MV"];
    return cell;
}

#pragma mark - UICollectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    [self.navigationController pushViewController:videoVC animated:YES];
}



@end
