//
//  KSNestedIndexPath.m
//  KSNestedTableView
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSNestedIndexPath.h"

@implementation KSNestedIndexPath
{
  NSMutableArray *_indexes;
}

- (id)init
{
  return [self initWithIndexes:nil];
}

- (id)initWithIndexes:(NSArray *)indexes
{
  self = [super init];
  if (!self) return nil;
  _indexes = [[NSMutableArray alloc] initWithArray:indexes copyItems:YES];
  return self;
}

- (NSUInteger)deep
{
  return [_indexes count];
}

- (NSUInteger)indexAtDeep:(NSUInteger)deep
{
  if (!(deep < [self deep])) return NSNotFound;
  return [[_indexes objectAtIndex:deep] unsignedIntegerValue];
}

- (void)addIndex:(NSUInteger)index
{
  [_indexes addObject:[NSNumber numberWithUnsignedInteger:index]];
}
   
- (BOOL)addIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
{
  if (!(deep < [self deep])) return NO;
  [_indexes insertObject:[NSNumber numberWithUnsignedInteger:index] atIndex:deep];
  return YES;
}

- (BOOL)changeIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
{
  if (!(deep < [self deep])) return NO;
  [_indexes replaceObjectAtIndex:deep withObject:[NSNumber numberWithUnsignedInteger:index]];
  return YES;
}

- (BOOL)removeIndexAtDeep:(NSUInteger)deep
{
  if (!(deep < [self deep])) return NO;
  [_indexes removeObjectAtIndex:deep];
  return YES;
}

@end
