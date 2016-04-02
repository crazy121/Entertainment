//
//  IntroCollectionViewCell.m
//  entertainment
//
//  Created by Metallic  on 16/2/28.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "IntroCollectionViewCell.h"

static NSString *identifier = @"MyCell";

@interface IntroCollectionViewCell()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation IntroCollectionViewCell
@synthesize image = _image;
@synthesize title = _title;
- (UIImage *)image
{
    if (!_image) {
        _image = [[UIImage alloc] init];
    }
    return _image;
}

- (void)setImage:(UIImage *)image
{
    if (!_image) {
        self.imageView.image = image;
    }
    _image = image;
}

- (NSString *)title
{
    if (!_title) {
        _title = @"111";
    }
    return _title;
}

- (void)setTitle:(NSString *)title
{
    if (!_title) {
        self.label.text = title;
    }
    _title = title;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 16);
        [self addSubview:self.imageView];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.imageView.bounds.size.height - 16, self.imageView.bounds.size.width, 16)];
        bottomView.backgroundColor = [UIColor blackColor];
        bottomView.alpha = 0.7;
        [self addSubview:bottomView];
        
        self.label.frame = CGRectMake(0, 0, self.imageView.bounds.size.width, 16);
        self.label.font = [UIFont fontWithName:@"Helvetica" size:11];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        [bottomView addSubview:self.label];
        
        UILabel *leftLabel = [[UILabel alloc] init];
        leftLabel.text = @"1796人";
        leftLabel.textColor = [UIColor grayColor];
        leftLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
        CGSize leftSize = [leftLabel sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
        leftLabel.frame = CGRectMake(0, self.imageView.frame.origin.y + self.imageView.bounds.size.height + 4, leftSize.width, leftSize.height);
        [self addSubview:leftLabel];
        
        UILabel *rightLabel = [[UILabel alloc] init];
        rightLabel.text = @"320%";
        rightLabel.textColor = [UIColor grayColor];
        rightLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
        CGSize rightSize = [rightLabel sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
        rightLabel.frame = CGRectMake(self.imageView.bounds.size.width - rightSize.width, leftLabel.frame.origin.y, rightSize.width, rightSize.height);
        [self addSubview:rightLabel];
    }
    return self;
}

- (void)updateUIWithImage:(NSString *)imageString andTitle:(NSString *)title
{
    UIImage *image = [UIImage imageNamed:imageString];
    self.imageView.image = image;
    self.label.text = title;
}

@end
