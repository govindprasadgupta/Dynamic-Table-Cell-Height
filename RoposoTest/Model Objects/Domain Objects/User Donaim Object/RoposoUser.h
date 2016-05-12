/**
 *  RoposoUser.h
 *  RoposoTest
 *  Purpose: This class is used as a domain object for storing user information.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import <Foundation/Foundation.h>

#define ASSOCIATED_USER_PREDICATE_TEXT                   @"userID"

@interface RoposoUser : NSObject <NSCoding> 

@property (nonatomic, strong) NSString      *aboutUser;
@property (nonatomic, strong) NSString      *userID; //Assuming user ID is unique
@property (nonatomic, strong) NSString      *userName;
@property (nonatomic, strong) NSString      *imageHref;
@property (nonatomic, strong) NSString      *profileHref;
@property (nonatomic, strong) NSString      *userHandle;
@property (nonatomic, assign) BOOL          isFollowing;
@property (nonatomic, assign) uint          userFollowers;
@property (nonatomic, assign) uint          userFollowing;
@property (nonatomic, assign) uint          createdOn;


@end
