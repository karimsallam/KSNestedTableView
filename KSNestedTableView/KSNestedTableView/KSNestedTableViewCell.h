//
//  KSNestedTableViewCell.h
//  KSNestedTableView
//
//  Created by Xinrui Gao on 14/09/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSNestedTableViewCell : UITableViewCell {
  NSUInteger deep;
  BOOL expanded;
}

@property (nonatomic) NSUInteger deep;
@property (nonatomic) BOOL expanded;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
               deep:(NSUInteger)_deep
           expanded:(BOOL)_expanded;

@end
