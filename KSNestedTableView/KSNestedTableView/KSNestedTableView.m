//
//  KSNestedTableView.m
//  KSNestedTableView
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSNestedTableView.h"
#import "KSNestedIndexPath.h"

@implementation KSNestedTableView
{
  UITableView *_tableView;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (!self) return nil;
  _tableView = [[UITableView alloc] initWithFrame:[self bounds]];
  [self addSubview:_tableView];
  return self;
}

- (void)reloadData
{
  KSNestedIndexPath *nestedIndexPath = [[KSNestedIndexPath alloc] initWithIndexes:[NSArray arrayWithObjects:[NSNumber numberWithUnsignedInteger:3], nil]];
  [nestedIndexPath addIndex:2];
  if ([nestedIndexPath indexAtDeep:[nestedIndexPath deep]] == NSNotFound)
  {
    NSLog(@"NSNotFound");
  }
  NSLog(@"index %d", [nestedIndexPath indexAtDeep:[nestedIndexPath deep] - 1]);
  
  
}

@end
