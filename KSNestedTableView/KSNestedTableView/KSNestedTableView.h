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

@interface KSNestedTableView : UIView

@property (weak, nonatomic) id <KSNestedTableViewDataSource> dataSource;

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


@end



