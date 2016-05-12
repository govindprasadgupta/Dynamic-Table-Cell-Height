/**
 *  RoposoUser.m
 *  RoposoTest
 *  Purpose: This class is used as a domain object for storing user information.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "RoposoUser.h"

@implementation RoposoUser

/**
 * Summary: initWithCoder:
 * This method is used to initialize an object from data in a given unarchiver.
 *
 * @param $decoder: An unarchiver object.
 *
 * @return: RoposoUser object
 */
- (id)initWithCoder:(NSCoder *)decoder {
    
    self = [super init];
    
    if (self) {
        
        [self setAboutUser:[decoder decodeObjectForKey:@"aboutUser"]];
        [self setUserID:[decoder decodeObjectForKey:@"userID"]];
        [self setUserName:[decoder decodeObjectForKey:@"userName"]];
        [self setUserFollowers:[[decoder decodeObjectForKey:@"userFollowers"] unsignedIntValue]];
        [self setUserFollowing:[[decoder decodeObjectForKey:@"userFollowing"] unsignedIntValue]];
        [self setImageHref:[decoder decodeObjectForKey:@"imageHref"]];
        [self setProfileHref:[decoder decodeObjectForKey:@"profileHref"]];
        [self setUserHandle:[decoder decodeObjectForKey:@"userHandle"]];
        [self setCreatedOn:[[decoder decodeObjectForKey:@"createdOn"] unsignedIntValue]];
        [self setIsFollowing:[[decoder decodeObjectForKey:@"isFollowing"] boolValue]];
    }
    return self;
}

/**
 * Summary: encodeWithCoder:
 * This method Encodes the receiver using a given archiver.
 *
 * @param $coder: An archiver object.
 *
 * @return:
 */
- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.aboutUser forKey:@"aboutUser"];
    [coder encodeObject:self.userID forKey:@"userID"];
    [coder encodeObject:self.userName forKey:@"userName"];
    [coder encodeObject:[NSNumber numberWithUnsignedInt:self.userFollowers] forKey:@"userFollowers"];
    [coder encodeObject:[NSNumber numberWithUnsignedInt:self.userFollowing] forKey:@"userFollowing"];
    [coder encodeObject:self.imageHref forKey:@"imageHref"];
    [coder encodeObject:self.profileHref forKey:@"profileHref"];
    [coder encodeObject:self.userHandle forKey:@"userHandle"];
    [coder encodeObject:[NSNumber numberWithUnsignedInt:self.createdOn] forKey:@"createdOn"];
    [coder encodeObject:[NSNumber numberWithBool:self.isFollowing] forKey:@"isFollowing"];
}

@end
