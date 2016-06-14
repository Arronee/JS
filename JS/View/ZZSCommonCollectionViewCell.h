//
//  ZZSCommonCollectionViewCell.h
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZSCommonCollectionViewCell : UICollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath;
/**
 *  显示的title
 */
@property (nonatomic, strong) NSString *showTitle;

@end
