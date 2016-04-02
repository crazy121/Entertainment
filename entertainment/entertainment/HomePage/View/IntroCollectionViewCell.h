//
//  IntroCollectionViewCell.h
//  entertainment
//
//  Created by Metallic  on 16/2/28.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;

- (void)updateUIWithImage:(NSString *)imageString andTitle:(NSString *)title;
@end
