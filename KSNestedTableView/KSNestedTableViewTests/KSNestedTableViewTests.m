//
//  KSNestedTableViewTests.m
//  KSNestedTableViewTests
//
//  Created by Karim Mohamed Abdel Aziz Sallam on 22/08/12.
//  Copyright (c) 2012 Karim Sallam. All rights reserved.
//

#import "KSNestedTableViewTests.h"
#import "KSNestedIndexPath.h"

@implementation KSNestedTableViewTests

- (void)setUp
{
  [super setUp];
  
  // Set-up code here.
}

- (void)tearDown
{
  // Tear-down code here.
  
  [super tearDown];
}

- (void)testKSNestedIndexPath
{
  KSNestedIndexPath *nestedIndexPath = nil;
  NSArray *indexes = nil;
  
  STAssertNoThrow(nestedIndexPath = [[KSNestedIndexPath alloc] init],
                  @"init method should work.");
  STAssertNoThrow(nestedIndexPath = [[KSNestedIndexPath alloc] initWithIndexes:nil],
                  @"Should work with nil array.");
  STAssertNoThrow(nestedIndexPath = [[KSNestedIndexPath alloc] initWithIndexes:[NSArray array]],
                  @"Should work with empty array.");
  indexes = [NSArray arrayWithObjects:
             [NSNumber numberWithUnsignedInteger:0],
             [NSNumber numberWithUnsignedInteger:1],
             [NSNumber numberWithUnsignedInteger:2],
             [NSNumber numberWithUnsignedInteger:3], nil];
  STAssertNoThrow(nestedIndexPath = [[KSNestedIndexPath alloc] initWithIndexes:indexes],
                  @"Should work with valid passed array of unsigned integers 0, 1, 2, 3.");
  
  STAssertTrue([[nestedIndexPath indexes] count] == 4,
               @"Should have 4 indexes.");
  STAssertTrue([nestedIndexPath deep] == 4,
               @"deep should be 4.");
  STAssertTrue([nestedIndexPath indexAtDeep:0] == 0,
               @"indexAtDeep: with deep 0 should return 0.");
  STAssertTrue([nestedIndexPath indexAtDeep:[nestedIndexPath deep]] == NSNotFound,
               @"indexAtDeep: with deep out of bounds should return NSNotFound.");
  
  
  // Adding indexes.
  STAssertNoThrow([nestedIndexPath addIndex:4],
                  @"Should add index.");
  STAssertTrue([nestedIndexPath addIndex:0 atDeep:0],
               @"Should add index at the beginning");
  STAssertTrue([nestedIndexPath addIndex:0 atDeep:2],
               @"Should add index in the bounds.");
  STAssertTrue([nestedIndexPath addIndex:5 atDeep:[nestedIndexPath deep] - 1],
               @"Should add index at the end");
  STAssertFalse([nestedIndexPath addIndex:18 atDeep:18],
                @"Should not add index beyound bounds.");
/*
  - (BOOL)changeIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
  - (BOOL)removeIndexAtDeep:(NSUInteger)deep;
  */
  
  /*
   // Returns NSNotFound if no index is found at the given deep.
   - (NSUInteger)indexAtDeep:(NSUInteger)deep;
   
   - (void)addIndex:(NSUInteger)index;
   - (BOOL)addIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
   - (BOOL)changeIndex:(NSUInteger)index atDeep:(NSUInteger)deep;
   - (BOOL)removeIndexAtDeep:(NSUInteger)deep;
   */
  indexes = [NSArray arrayWithObjects:
             [NSNumber numberWithUnsignedInteger:0],
             [NSNumber numberWithUnsignedInteger:-1],
             [NSNumber numberWithUnsignedInteger:-232],
             [NSNumber numberWithUnsignedInteger:3], nil];
  STAssertNoThrow(nestedIndexPath = [[KSNestedIndexPath alloc] initWithIndexes:indexes],
                  @"initWithIndexes: method should work with valid unsigned integers 0, 1, 2, 3");
}

@end
