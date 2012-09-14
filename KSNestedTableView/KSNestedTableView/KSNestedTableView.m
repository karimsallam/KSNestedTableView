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
  KSNestedIndexPath *nestedIndexPath;
  NSMutableArray *expandedIndexPathes;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (!self) return nil;
  
  _tableView = [[UITableView alloc] initWithFrame:[self bounds]];
  _tableView.delegate = self;
  _tableView.dataSource = self;
  [self addSubview:_tableView];
  
  expandedIndexPathes = [NSMutableArray array];
  
  return self;
}

- (void)reloadData
{
  nestedIndexPath = [[KSNestedIndexPath alloc] initWithIndexes:[NSArray arrayWithObjects:[NSNumber numberWithUnsignedInteger:3], nil]];
  [nestedIndexPath addIndex:2];
  if ([nestedIndexPath indexAtDeep:[nestedIndexPath deep]] == NSNotFound)
  {
    NSLog(@"NSNotFound");
  }
  NSLog(@"index %d", [nestedIndexPath indexAtDeep:[nestedIndexPath deep] - 1]);
  
  //[_tableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [_dataSource numberOfSectionsInNestedTableView:self atNestedIndexPath:nestedIndexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_dataSource nestedTableView:self atNestedIndexPath:nestedIndexPath numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return (UITableViewCell *)[_dataSource nestedTableView:self atNestedIndexPath:nestedIndexPath cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
  
  for (NSIndexPath *anIndexPath in expandedIndexPathes) {
    if ([anIndexPath isEqual:indexPath]) {
      [_dataSource nestedTableView:self atNestedIndexPath:nestedIndexPath deleteRowAtIndexPath:newIndexPath];
      [expandedIndexPathes removeObject:anIndexPath];
      return;
    }
  }
  
  [_dataSource nestedTableView:self atNestedIndexPath:nestedIndexPath insertRowAtIndexPath:newIndexPath];
  [expandedIndexPathes addObject:indexPath];
  
}

@end
