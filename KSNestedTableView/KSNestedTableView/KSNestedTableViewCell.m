//
//  KSNestedTableViewCell.m
//  KSNestedTableView
//
//  Created by Xinrui Gao on 14/09/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSNestedTableViewCell.h"

@implementation KSNestedTableViewCell
@synthesize deep, expanded;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
               deep:(NSUInteger)_deep
           expanded:(BOOL)_expanded {
  
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
  if (self) {
		self.deep = _deep;
		self.expanded = _expanded;
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  CGRect contentRect = self.contentView.bounds;
  if (!self.editing) {
    CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
		frame = CGRectMake((boundsX + self.deep + 1) * 20.0,
                       0,
                       320.0 - (self.deep * 20.0),
                       44.0);
		self.textLabel.frame = frame;
	}
}

@end
