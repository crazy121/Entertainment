//
//  SupportTableViewCell.m
//  entertainment
//
//  Created by Metallic  on 16/3/6.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "SupportTableViewCell.h"

@implementation SupportTableViewCell

- (void)awakeFromNib {
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.cornerRadius = 10;
}

@end
