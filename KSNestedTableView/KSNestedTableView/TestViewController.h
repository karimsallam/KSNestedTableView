//
//  TestViewController.h
//  KSNestedTableView
//
//  Created by Xinrui Gao on 14/09/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSNode.h"

@interface TestViewController : UIViewController {
	KSNode *rootNode;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
