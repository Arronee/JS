//
//  ZHMListData.h
//  JS
//
//  Created by zm on 16/3/22.
//  Copyright © 2016年 zhM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHMListData : NSObject
/**
 *  页头显示的title
 */
@property (nonatomic, strong) NSString *headerTitle;
/**
 *  对应的下级元素
 */
@property (nonatomic, strong) NSArray *subArray;
/**
 *  <#Description#>
 *
 *  @param headerTitle <#headerTitle description#>
 *  @param subArray    <#subArray description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithHeaderTitle:(NSString *)headerTitle
                           subArray:(NSArray <NSString *> *)subArray;

+ (instancetype)listDataWithHeaderTitle:(NSString *)headerTitle
                               subArray:(NSArray <NSString *> *)subArray;

@end
