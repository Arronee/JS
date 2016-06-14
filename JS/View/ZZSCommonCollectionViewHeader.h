//
//  ZZSCommonCollectionViewHeader.h
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZSCommonCollectionViewHeader : UICollectionReusableView

+ (instancetype)headerWithCollectionView:(UICollectionView *)collectionView
                               indexPath:(NSIndexPath *)indexPath;

/**
 *  显示的title
 */
@property (nonatomic, strong) NSString *showTitle;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void(^ShowListBlock)(NSIndexPath *indexPath);

/**
 *  按钮是否选中
 */
@property (nonatomic, assign) BOOL isButtonSelected  ;

@end
