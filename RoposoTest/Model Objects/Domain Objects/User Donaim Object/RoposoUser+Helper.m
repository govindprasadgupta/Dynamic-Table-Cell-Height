/**
 *  RoposoUser+Helper.m
 *  RoposoTest
 *  Purpose: This helper category is used to perform action related to RoposoUser model.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "RoposoUser+Helper.h"
#import "RoposoDOConstant.h"
#import "BusinessUtility.h"
#import "FileUtility.h"
#import "FileConstant.h"

@implementation RoposoUser (Helper)

/**
 * Summary: createAndSaveRoposoUserWithInfo:
 * This method is used to create and save RoposoUser object for given information.
 *
 * @param $RoposoUserInfo: RoposoUser information
 *
 * @return: RoposoUser object
 */
+ (RoposoUser *)createAndSaveRoposoUserWithInfo:(NSDictionary *)roposoUserInfo {
    
    RoposoUser *roposoUser = nil;
    if ([roposoUserInfo valueForKey:USER_ID_JSON_KEY] ) {
        
        roposoUser = [[RoposoUser alloc] init];
        [roposoUser setRoposoUserWithData:roposoUserInfo];
        
    } else {
        
        NSLog(@"roposoUserInfo does not have user ID with user info %@",roposoUserInfo.description);
    }
    
    return roposoUser;
}

/**
 * Summary: setRoposoUserWithData:
 * This method is set attributes for roposo user entity.
 *
 * @param $roposoUserInfo: Roposo user information
 *
 * @return:
 */
- (void)setRoposoUserWithData:(NSDictionary *)roposoUserInfo {
    
    id  nodeDetail  =   nil;
    

    if((nodeDetail = [roposoUserInfo valueForKey:USER_ABOUT_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.aboutUser  =  nodeDetail;
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_ID_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.userID  =  nodeDetail;
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_NAME_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.userName  =  nodeDetail;
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_FOLLOWER_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.userFollowers  =  [nodeDetail unsignedIntValue];
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_FOLLOWING_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.userFollowing  =  [nodeDetail unsignedIntValue];
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_IMAGE_HREF_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.imageHref  =  nodeDetail;
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_PROFILE_HREF_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.profileHref  =  nodeDetail;
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_HANDLE_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.userHandle  =  nodeDetail;
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_CREATED_ON_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.createdOn  =  [nodeDetail unsignedIntValue];
    }
    if((nodeDetail = [roposoUserInfo valueForKey:USER_IS_FOLLOWING_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.isFollowing  =  [nodeDetail boolValue];
    }
    
}

/** Summary: saveRoposoUserList:
 *  This method is used to save roposo user in plist.
 *
 * @param $roposoUserArray: roposo user list.
 *
 * @return:
 */
+ (void)saveRoposoUserList:(NSArray *)roposoUserArray {

    NSString *filePath = [FileUtility getpathForFileName:ROPOSO_USER_OBJECT_FILE_PATH];
    if (roposoUserArray) {
        
         [NSKeyedArchiver archiveRootObject:roposoUserArray toFile:filePath];
    }
}

/** Summary: updateRoposoUserListForUser:
 *  This method is used to update roposo user in plist.
 *
 * @param $user: roposo user .
 *
 * @return:
 */
+ (void)updateRoposoUserListForUser:(RoposoUser *)user {
    
    NSString *filePath = [FileUtility getpathForFileName:ROPOSO_USER_OBJECT_FILE_PATH];
    NSArray *userList = [RoposoUser getRoposoUserList];
    NSPredicate *roposoUserPredicate = [NSPredicate predicateWithFormat:@"%K ==[c] %@",ASSOCIATED_USER_PREDICATE_TEXT,user.userID];
    RoposoUser *roposoUser = [[userList filteredArrayUsingPredicate:roposoUserPredicate] firstObject];
    roposoUser.isFollowing = user.isFollowing;
    [NSKeyedArchiver archiveRootObject:userList toFile:filePath];
    
}

/**
 * Summary: getRoposoUserList
 * This method is fetch roposo user list.
 *
 * @return: Roposo user Lsit
 */
+ (NSArray *)getRoposoUserList {
    
    NSArray *roposoUserList = [NSArray array];
    
    NSString *filePath = [FileUtility getpathForFileName: ROPOSO_USER_OBJECT_FILE_PATH];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        roposoUserList = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    
    return roposoUserList;
    
}

@end