//
//  ViewController.m
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import "ViewController.h"
#import "ZZSCommonCollectionViewCell.h"
#import "ZZSCommonCollectionViewHeader.h"

#import "ZHMListData.h"
// 屏幕宽度
#define k_screenWidth  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource,
UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
// 静态数组数据
@property (nonatomic, strong) NSMutableArray *staticDataArray;
// 被点击的indexPath
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupSubViews];
}

- (void)setupSubViews {
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor colorWithWhite:0.944 alpha:1.000];
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
    
    // 注册相关cell
    [collectionView registerClass:[ZZSCommonCollectionViewCell class] forCellWithReuseIdentifier:@"ZZSCommonCollectionViewCell"];
    [collectionView registerClass:[ZZSCommonCollectionViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZZSCommonCollectionViewHeader"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.staticDataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    ZHMListData *listData = _staticDataArray[section];
    if (_indexPath.section == section && _indexPath != nil) {
        NSArray *array = listData.subArray;
        return array.count;
    } else {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZZSCommonCollectionViewCell *cell = [ZZSCommonCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    // 设置显示数据
    ZHMListData *listData = _staticDataArray[indexPath.section];
    NSArray *array = listData.subArray;
    cell.showTitle = array[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    ZZSCommonCollectionViewHeader *header = [ZZSCommonCollectionViewHeader headerWithCollectionView:collectionView indexPath:indexPath];
    header.backgroundColor = [UIColor whiteColor];
    // 设置显示数据
    ZHMListData *listData = _staticDataArray[indexPath.section];
    header.showTitle = listData.headerTitle;
    header.indexPath = indexPath;
    // 按钮的图片
    header.isButtonSelected = [_indexPath isEqual:indexPath];
    
    // header上button点击事件
    __weak typeof(self) weakSelf = self;
    [header setShowListBlock:^(NSIndexPath *clickedIndexPath) {
        if (weakSelf.indexPath == clickedIndexPath) {
            weakSelf.indexPath = nil;
        } else {
            weakSelf.indexPath = clickedIndexPath;
        }
        [weakSelf.collectionView reloadData];
    }];
    
    return header;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsZero;
    return UIEdgeInsetsMake(1, 5, 10, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(k_screenWidth, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((k_screenWidth - 30)/3.0, 40);
}

- (NSMutableArray *)staticDataArray {
    if (_staticDataArray == nil) {
        _staticDataArray = [NSMutableArray array];
        
        for (int i = 0; i < 3; i++) {
            NSMutableArray *titleArray = [NSMutableArray array];
            for (int j = 0; j < 7; j++) {
                NSString *showTitle = [NSString stringWithFormat:@"%d", arc4random() % 1024];
                [titleArray addObject:showTitle];
            }
            ZHMListData *listData = [ZHMListData listDataWithHeaderTitle:[NSString stringWithFormat:@"这是%d", i]
                                                                subArray:titleArray];
            [_staticDataArray addObject:listData];
        }
    }
    return _staticDataArray;
}

@end
