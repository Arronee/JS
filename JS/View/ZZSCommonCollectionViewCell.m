//
//  ZZSCommonCollectionViewCell.m
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import "ZZSCommonCollectionViewCell.h"

@interface ZZSCommonCollectionViewCell ()
// 显示的标题
@property (nonatomic, weak) UILabel *titleLabel;
// 下拉button
@property (nonatomic, weak) UIButton *dropButton;

@end

@implementation ZZSCommonCollectionViewCell

- (void)setShowTitle:(NSString *)showTitle {
    _showTitle = showTitle;
    
    _titleLabel.text = _showTitle;
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ZZSCommonCollectionViewCell";
    ZZSCommonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ZZSCommonCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupSubViews];
    }
    return self;
}

- (void)p_setupSubViews {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:label];
    _titleLabel = label;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = self.bounds;
}

@end
