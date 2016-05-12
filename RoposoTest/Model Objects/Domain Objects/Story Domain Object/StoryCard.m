/**
 *  StoryCard.m
 *  RoposoTest
 *  Purpose: This class is used as a domain object for storing story card information.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "StoryCard.h"

@implementation StoryCard

/**
 * Summary: initWithCoder:
 * This method is used to initialize an object from data in a given unarchiver.
 *
 * @param $decoder: An unarchiver object.
 *
 * @return: StoryCard object
 */
- (id)initWithCoder:(NSCoder *)decoder {
    
    self = [super init];
    
    if (self) {
        
        [self setStoryDescription:[decoder decodeObjectForKey:@"storyDescription"]];
        [self setStoryID:[decoder decodeObjectForKey:@"storyID"]];
        [self setStoryCreated:[decoder decodeObjectForKey:@"storyCreated"]];
        [self setAssociatedUser:[decoder decodeObjectForKey:@"associatedUser"]];
        [self setStoryURL:[decoder decodeObjectForKey:@"storyURL"]];
        [self setImageHref:[decoder decodeObjectForKey:@"imageHref"]];
        [self setStoryType:[decoder decodeObjectForKey:@"storyType"]];
        [self setStoryTitle:[decoder decodeObjectForKey:@"storyTitle"]];
        [self setIsLike:[[decoder decodeObjectForKey:@"isLike"] boolValue]];
        [self setLikeCount:[[decoder decodeObjectForKey:@"likeCount"] unsignedIntValue]];
        [self setCommentCount:[[decoder decodeObjectForKey:@"commentCount"] unsignedIntValue]];
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
    
    [coder encodeObject:self.storyDescription forKey:@"storyDescription"];
    [coder encodeObject:self.storyID forKey:@"storyID"];
    [coder encodeObject:self.storyCreated forKey:@"storyCreated"];
    [coder encodeObject:self.associatedUser forKey:@"associatedUser"];
    [coder encodeObject:self.storyURL forKey:@"storyURL"];
    [coder encodeObject:self.imageHref forKey:@"imageHref"];
    [coder encodeObject:self.storyType forKey:@"storyType"];
    [coder encodeObject:self.storyTitle forKey:@"storyTitle"];
    [coder encodeObject:[NSNumber numberWithBool:self.isLike] forKey:@"isLike"];
    [coder encodeObject:[NSNumber numberWithUnsignedInt:self.likeCount] forKey:@"likeCount"];
    [coder encodeObject:[NSNumber numberWithUnsignedInt:self.commentCount] forKey:@"commentCount"];
}


@end
