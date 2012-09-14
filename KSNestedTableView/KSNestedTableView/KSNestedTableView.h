//
//  KSNestedTableView.h
//  KSNestedTableView
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSNestedIndexPath;
@class KSNestedTableViewCell;

@protocol KSNestedTableViewDataSource;

@interface KSNestedTableView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) id <KSNestedTableViewDataSource> dataSource;

@property (strong, nonatomic) UITableView *tableView; 

@property (nonatomic, getter = isMultipleSelectionEnabled) BOOL multipleSelectionEnabled;

- (void)reloadData;

@end

@protocol KSNestedTableViewDataSource <NSObject>

- (NSInteger)numberOfSectionsInNestedTableView:(KSNestedTableView *)nestedTableView
                             atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath;

- (NSInteger)nestedTableView:(KSNestedTableView *)nestedTableView
           atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
       numberOfRowsInSection:(NSInteger)section;

- (KSNestedTableViewCell *)nestedTableView:(KSNestedTableView *)nestedTableView
                         atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
                     cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)nestedTableView:(KSNestedTableView *)nestedTableView
      atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
   insertRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)nestedTableView:(KSNestedTableView *)nestedTableView
      atNestedIndexPath:(KSNestedIndexPath *)nestedIndexPath
   deleteRowAtIndexPath:(NSIndexPath *)indexPath;

@end



