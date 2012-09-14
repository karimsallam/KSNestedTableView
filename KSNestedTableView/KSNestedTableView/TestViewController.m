//
//  TestViewController.m
//  KSNestedTableView
//
//  Created by Xinrui Gao on 14/09/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "TestViewController.h"
#import "KSNestedTableViewCell.h"

@implementation TestViewController
@synthesize tableView;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //Sample test data
  NSArray *dataLv301 = [NSArray arrayWithObjects:@"Lv3011", @"Lv3012", @"Lv3013", nil];
  NSArray *dataLv302 = [NSArray arrayWithObjects:@"Lv3021", @"Lv3022", @"Lv3023", nil];
  NSArray *dataLv303 = [NSArray arrayWithObjects:@"Lv3031", @"Lv3032", @"Lv3033", nil];
  
  NSArray *dataLv201 = [NSArray arrayWithObjects:dataLv301, dataLv302, dataLv303, @"test", nil];
  NSArray *dataLv202 = [NSArray arrayWithObjects:dataLv301, dataLv302, nil];
  NSArray *dataLv203 = [NSArray arrayWithObjects:dataLv301, dataLv302, @"test", nil];
  NSArray *dataLv204 = [NSArray arrayWithObjects:dataLv301, @"test", nil];
  
  NSArray *dataLv101 = [NSArray arrayWithObjects:dataLv201, dataLv202, dataLv203, dataLv204, dataLv201, @"test", dataLv202, nil];
  
	rootNode = [[KSNode alloc] initWithValue:@"Root Node"];
  
  [self buildTreeWithData:dataLv101 parent:rootNode andDepth:0];
  
}

- (void)viewDidUnload {
  [self setTableView:nil];
}

//Build the tree with children data, parent node and parent depth
- (void)buildTreeWithData:(NSArray *)data parent:(KSNode *)parent andDepth:(NSUInteger)depth {
  for (int i = 0; i < data.count; i++) {
    KSNode *node = [[KSNode alloc] initWithValue:[NSString stringWithFormat:@"Node %d - %d",depth+1, i+1]];
    [parent addChild:node];
    if ([[data objectAtIndex:i] isKindOfClass:[NSArray class]]) {
      [self buildTreeWithData:[data objectAtIndex:i] parent:node andDepth:depth+1];
      node.inclusive = NO;
    }
  }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [rootNode descendantCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
	
  KSNode *node = [[rootNode flattenElements] objectAtIndex:indexPath.row + 1];
	KSNestedTableViewCell *cell = [[KSNestedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                             reuseIdentifier:CellIdentifier
                                                                        deep:[node getDepth] - 1
                                                                    expanded:node.inclusive];
	cell.textLabel.text = node.value;
	
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	KSNode *node = [[rootNode flattenElements] objectAtIndex:indexPath.row + 1];
	if (!node.hasChildren) return;
	
	node.inclusive = !node.inclusive;
	[rootNode flattenElementsWithCacheRefresh:YES];
	[self.tableView reloadData];
}

@end

