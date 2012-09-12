//
//  KSViewController.m
//  KSNestedTableView
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSViewController.h"
#import "KSNestedTableView.h"

@interface KSViewController ()

@end

@implementation KSViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  KSNestedTableView *nestedTableView = [[KSNestedTableView alloc] initWithFrame:self.view.bounds];
  [nestedTableView reloadData];
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

@end
