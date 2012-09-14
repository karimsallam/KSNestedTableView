//
//  KSNode.h
//  KSNestedTableView
//
//  Created by Xinrui Gao on 14/09/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSNode.h"

@interface KSNode : NSObject {
  NSUInteger index;
  NSString *value;
  KSNode *parent;
  NSMutableArray *children;
  BOOL inclusive;
  NSArray *flattenedTreeCache;
}

@property (nonatomic) NSUInteger index;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) KSNode *parent;
@property (nonatomic, strong, readonly) NSMutableArray *children;
@property (nonatomic) BOOL inclusive;

- (id)initWithValue:(NSString *)_value;

- (void)addChild:(KSNode *)newChild;
- (NSUInteger)descendantCount;
- (NSUInteger)getDepth;
- (NSArray *)flattenElements;
- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate;
- (BOOL)isRoot;
- (BOOL)hasChildren;

@end
