//
//  KSViewController.m
//  KSNestedTableView
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSViewController.h"
#import "KSNestedTableView.h"
#import "KSNestedIndexPath.h"

@interface KSViewController () <KSNestedTableViewDataSource>
{
  NSMutableArray *dataArray;
}


@end

@implementation KSViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  dataArray = [[NSMutableArray alloc] initWithObjects:@"Lv_1", @"Lv_1", @"Lv_1", @"Lv_1", @"Lv_1", nil];
  
  KSNestedTableView *nestedTableView = [[KSNestedTableView alloc] initWithFrame:self.view.bounds];
  nestedTableView.dataSource = self;
  [nestedTableView reloadData];
  [self.view addSubview:nestedTableView];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

#pragma mark - KSNestedTableViewDataSource

- (NSInteger)numberOfSectionsInNestedTableView:(KSNestedTableView *)nestedTableView
                             atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
{
  return 1;
}

- (NSInteger)nestedTableView:(KSNestedTableView *)nestedTableView
           atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
       numberOfRowsInSection:(NSInteger)section
{
  return dataArray.count;
}

- (KSNestedTableViewCell *)nestedTableView:(KSNestedTableView *)nestedTableView
                         atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
                     cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifier = @"KSNestedCell";

  UITableViewCell *cell = [nestedTableView.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.textLabel.text = [NSString stringWithFormat:@"%@ - %d", [dataArray objectAtIndex:indexPath.row], indexPath.row];
  
  return (KSNestedTableViewCell *)cell;
}

- (void)nestedTableView:(KSNestedTableView *)nestedTableView
      atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
   insertRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSIndexPath *newIndexPath2 = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
  NSIndexPath *newIndexPath3 = [NSIndexPath indexPathForRow:indexPath.row+2 inSection:indexPath.section];
  [dataArray insertObject:[NSString stringWithFormat:@"Lv_%d", nestedIndexPath.deep] atIndex:indexPath.row];
  [dataArray insertObject:[NSString stringWithFormat:@"Lv_%d", nestedIndexPath.deep] atIndex:indexPath.row+1];
  [dataArray insertObject:[NSString stringWithFormat:@"Lv_%d", nestedIndexPath.deep] atIndex:indexPath.row+2];
  [nestedTableView reloadData];
  
  NSArray *rowsToInsert = [NSArray arrayWithObjects:indexPath, newIndexPath2, newIndexPath3, nil];
  [nestedTableView.tableView insertRowsAtIndexPaths:rowsToInsert withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)nestedTableView:(KSNestedTableView *)nestedTableView
      atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
   deleteRowAtIndexPath:(NSIndexPath *)indexPath
{
  [dataArray removeObjectAtIndex:indexPath.row+2];
  [dataArray removeObjectAtIndex:indexPath.row+1];
  [dataArray removeObjectAtIndex:indexPath.row];
  
  
  [nestedTableView reloadData];
  
  NSIndexPath *newIndexPath2 = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
  NSIndexPath *newIndexPath3 = [NSIndexPath indexPathForRow:indexPath.row+2 inSection:indexPath.section];
  NSArray *rowsToDelete = [NSArray arrayWithObjects:indexPath, newIndexPath2, newIndexPath3, nil];
  [nestedTableView.tableView deleteRowsAtIndexPaths:rowsToDelete withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
