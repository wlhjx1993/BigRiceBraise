//
//  NSIndexPath+Offset.h
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface NSIndexPath (Offset)

/* Compute specifies row indexpath */
- (NSIndexPath *)specifiesRow:(NSInteger)i;

/* Compute previous row indexpath */
- (NSIndexPath *)previousRow;

/* Compute next row indexpath */
- (NSIndexPath *)nextRow;

/* Compute previous item indexpath */
- (NSIndexPath *)previousItem;

/* Compute next item indexpath */
- (NSIndexPath *)nextItem;


/* Compute specifies section indexpath */
- (NSIndexPath *)specifiesSection:(NSInteger)i;

/* Compute next section indexpath */
- (NSIndexPath *)nextSection;

/* Compute previous section indexpath */
- (NSIndexPath *)previousSection;

@end
