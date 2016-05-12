/**
 *  BaseTableViewCell.h
 *  RoposoTest
 *  Purpose: This table view cell class is used as base class for all custom table cell class.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

/**
 * Summary: loadTableViewCellFromNib:
 * This method is used to create table cell instance.
 *
 * @return: Table view cell instance
 */
+ (UITableViewCell *)loadTableViewCellFromNib;


@end
