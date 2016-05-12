/**
 *  StoryCard.h
 *  RoposoTest
 *  Purpose: This class is used as a domain object for storing story card information.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface StoryCard : NSObject

@property (nonatomic, strong) NSString      *storyDescription;
@property (nonatomic, strong) NSString      *storyID; //Assuming user ID is unique
@property (nonatomic, strong) NSString      *storyCreated;
@property (nonatomic, strong) NSString      *associatedUser;
@property (nonatomic, strong) NSString      *storyURL;
@property (nonatomic, strong) NSString      *imageHref;
@property (nonatomic, strong) NSString      *storyType;
@property (nonatomic, strong) NSString      *storyTitle;
@property (nonatomic, assign) BOOL          isLike;
@property (nonatomic, assign) uint          likeCount;
@property (nonatomic, assign) uint          commentCount;

@end
