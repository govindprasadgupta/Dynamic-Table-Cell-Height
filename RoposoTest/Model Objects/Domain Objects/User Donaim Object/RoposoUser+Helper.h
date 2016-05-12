/**
 *  RoposoUser+Helper.h
 *  RoposoTest
 *  Purpose: This helper category is used to perform action related to RoposoUser model.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "RoposoUser.h"

@interface RoposoUser (Helper)

/**
 * Summary: createAndSaveRoposoUserWithInfo:
 * This method is used to create and save RoposoUser object for given information.
 *
 * @param $RoposoUserInfo: RoposoUser information
 *
 * @return: RoposoUser object
 */
+ (RoposoUser *)createAndSaveRoposoUserWithInfo:(NSDictionary *)roposoUserInfo;

/** Summary: saveRoposoUserList:
 *  This method is used to save roposo user in plist.
 *
 * @param $roposoUserArray: roposo user list.
 *
 * @return:
 */
+ (void)saveRoposoUserList:(NSArray *)roposoUserArray;

/**
 * Summary: getRoposoUserList
 * This method is fetch roposo user list.
 *
 * @return: Roposo user Lsit
 */
+ (NSArray *)getRoposoUserList;

/** Summary: updateRoposoUserListForUser:
 *  This method is used to update roposo user in plist.
 *
 * @param $user: roposo user .
 *
 * @return:
 */
+ (void)updateRoposoUserListForUser:(RoposoUser *)user;

@end
