


//
//  ZZSCommonCollectionViewHeader.m
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import "ZZSCommonCollectionViewHeader.h"

@interface ZZSCommonCollectionViewHeader ()

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UIButton *showListButton;

@end

@implementation ZZSCommonCollectionViewHeader

- (void)setShowTitle:(NSString *)showTitle {
    _showTitle = showTitle;
    
    _titleLabel.text = _showTitle;
}


- (void)setIsButtonSelected:(BOOL)isButtonSelected {
    _isButtonSelected = isButtonSelected;
    // 设置下拉按钮的选中
    _showListButton.selected = _isButtonSelected;
}


+ (instancetype)headerWithCollectionView:(UICollectionView *)collectionView
                               indexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ZZSCommonCollectionViewHeader";
    ZZSCommonCollectionViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
    if (header == nil) {
        header = [[ZZSCommonCollectionViewHeader alloc] initWithFrame:CGRectZero];
    }
    return header;
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
    [self addSubview:label];
    _titleLabel = label;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"iconfont-xiangxia1"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"iconfont-xiangshang1"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(showListItem) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _showListButton = button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(0, 0, 100, CGRectGetHeight(self.bounds));
    _showListButton.frame = CGRectMake(CGRectGetWidth(self.bounds)- 100, 0, 100, CGRectGetHeight(self.bounds));
}

#pragma mark - button点击事件
- (void)showListItem {
    if (self.ShowListBlock) {
        self.ShowListBlock(_indexPath);
    }
}

@end
