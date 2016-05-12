/**
 *  UserDetailTableCell.h
 *  RoposoTest
 *  Purpose: This table view cell class is used for displaying user detail
 *
 *  Created by Govind Gupta on 5/4/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#define USER_DETAIL_CELL_TABLE_HEIGHT                              256

#import "BaseTableViewCell.h"
#import "RoposoUser.h"

@interface UserDetailTableCell : BaseTableViewCell

/**
 * Summary: setUserDetailForRoposoUser:
 * This method is used to set view according to given roposo user
 *
 * @param $roposoUser: Roposo user object
 *
 * @return:
 */
- (void)setUserDetailForRoposoUser:(RoposoUser *)roposoUser;

@end
