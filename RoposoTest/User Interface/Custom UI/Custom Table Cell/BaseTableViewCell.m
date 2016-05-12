/**
 *  BaseTableViewCell.m
 *  RoposoTest
 *  Purpose: This table view cell class is used as base class for all custom table cell class.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

/**
 * Summary: loadTableViewCellFromNib
 * This method is used to create table cell instance.
 *
 * @return: Table view cell instance
 */
+ (UITableViewCell *)loadTableViewCellFromNib {
    
    NSString    *nibName        = NSStringFromClass(self);
    NSArray     *nibContents    = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    UITableViewCell *cell       = [nibContents objectAtIndex:0];
    cell.selectionStyle         = UITableViewCellSelectionStyleNone;
    cell.exclusiveTouch = YES;
    [cell.contentView setClipsToBounds:YES];
    
    return cell;
}




@end
