

//
//  ZHMListData.m
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import "ZHMListData.h"

@implementation ZHMListData

- (instancetype)initWithHeaderTitle:(NSString *)headerTitle
                           subArray:(NSArray<NSString *> *)subArray {
    self = [super init];
    if (self) {
        _headerTitle = headerTitle;
        _subArray = subArray;
    }
    return self;
}

+ (instancetype)listDataWithHeaderTitle:(NSString *)headerTitle
                               subArray:(NSArray <NSString *> *)subArray {
    ZHMListData *listData = [[ZHMListData alloc] initWithHeaderTitle:headerTitle subArray:subArray];
    return listData;
}

@end
