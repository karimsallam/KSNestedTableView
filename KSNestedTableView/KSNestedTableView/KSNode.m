//
//  KSNode.m
//  KSNestedTableView
//
//  Created by Xinrui Gao on 14/09/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSNode.h"

@implementation KSNode

@synthesize index, value;
@synthesize parent, children;
@synthesize inclusive;

- (id)initWithValue:(NSString *)_value {
	self = [super init];
	if (self) {
		value = _value;
		inclusive = YES;
	}
	
	return self;
}

- (NSMutableArray *)children {
	if (!children) {
		children = [[NSMutableArray alloc] initWithCapacity:1];
	}
	
	return children;
}

- (NSUInteger)descendantCount {
	NSUInteger count = 0;
	
	for (KSNode *child in self.children) {
		if (self.inclusive) {
			count++;
			if (child.children.count > 0) {
				count += [child descendantCount];
			}
		}
	}
	
	return count;
}

- (NSArray *)flattenElements {
	return [self flattenElementsWithCacheRefresh:NO];
}

- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate {
	if (!flattenedTreeCache || invalidate) {
		//if there was a previous cache and due for invalidate, release resources first
		if (flattenedTreeCache) {
			flattenedTreeCache = nil;
		}
		
		NSMutableArray *allElements = [[NSMutableArray alloc] initWithCapacity:[self descendantCount]];
		[allElements addObject:self];
		
		if (inclusive) {
			for (KSNode *child in self.children) {
				[allElements addObjectsFromArray:[child flattenElementsWithCacheRefresh:invalidate]];
			}
		}
		
		flattenedTreeCache = [[NSArray alloc] initWithArray:allElements];
	}
	
	return flattenedTreeCache;
}

- (void)addChild:(KSNode *)newChild {
	newChild.parent = self;
	[self.children addObject:newChild];
}

- (NSUInteger)getDepth {
	if (!parent) return 0;
	
	NSUInteger count = 0;
	count++;
	count += [parent getDepth];
	
	return count;
}

- (BOOL)isRoot {
	return (!parent);
}

- (BOOL)hasChildren {
	return (self.children.count > 0);
}

@end
