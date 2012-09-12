//
//  KSNestedIndexPath.h
//  KSNestedTableView
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSNestedIndexPath : NSObject

- (id)initWithIndexes:(NSArray *)indexes;

@property (readonly, strong, nonatomic) NSArray *indexes;
@property (readonly, nonatomic) NSUInteger deep;

// Returns NSNotFound if no index is found at the given deep.
- (NSUInteger)indexAtDeep:(NSUInteger)deep;

- (void)addIndex:(NSUInteger)index;
- (BOOL)addIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
- (BOOL)changeIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
- (BOOL)removeIndexAtDeep:(NSUInteger)deep;

@end
