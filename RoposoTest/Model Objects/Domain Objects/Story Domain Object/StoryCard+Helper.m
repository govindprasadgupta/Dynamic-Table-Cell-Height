/**
 *  StoryCard+Helper.m
 *  RoposoTest
 *  Purpose: This helper category is used to perform action related to StoryCard model.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "StoryCard+Helper.h"
#import "RoposoDOConstant.h"
#import "BusinessUtility.h"
#import "FileUtility.h"
#import "FileConstant.h"

@implementation StoryCard (Helper)

/**
 * Summary: createAndSaveStoryCardWithInfo:
 * This method is used to create and save StoryCard object for given information.
 *
 * @param $storyCardInfo: StoryCard information
 *
 * @return: StoryCard object
 */
+ (StoryCard *)createAndSaveStoryCardWithInfo:(NSDictionary *)storyCardInfo {
    
    StoryCard *storyCard = nil;
    if ([storyCardInfo valueForKey:CARD_ID_JSON_KEY] ) {
        
        storyCard = [[StoryCard alloc] init];
        [storyCard setStoryCardWithData:storyCardInfo];
        
    } else {
        
        NSLog(@"storyCardInfo does not have card ID with card info %@",storyCardInfo.description);
    }
    
    return storyCard;
}

/**
 * Summary: setStoryCardWithData:
 * This method is set attributes for story card entity.
 *
 * @param $storyCardInfo: Story card information
 *
 * @return:
 */
- (void)setStoryCardWithData:(NSDictionary *)storyCardInfo {
    
    id  nodeDetail  =   nil;
    
    
    if((nodeDetail = [storyCardInfo valueForKey:CARD_DESCRIPTION_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.storyDescription  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_ID_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.storyID  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_VERB_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.storyCreated  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_DB_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.associatedUser  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_URL_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.storyURL  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_SI_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.imageHref  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_TYPE_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.storyType  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_TITLE_JSON_KEY]) &&
       [BusinessUtility validateStringTypeDetail:nodeDetail]) {
        
        self.storyTitle  =  nodeDetail;
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_IS_LIKE_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.isLike  =  [nodeDetail boolValue];
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_LIKE_COUNT_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.likeCount  =  [nodeDetail unsignedIntValue];
    }
    if((nodeDetail = [storyCardInfo valueForKey:CARD_COMMENT_COUNT_JSON_KEY]) &&
       [BusinessUtility validateNumberTypeDetail:nodeDetail]) {
        
        self.commentCount  =  [nodeDetail unsignedIntValue];
    }
    
}

/** Summary: saveStoryCardList:
 *  This method is used to save story card in plist.
 *
 * @param $storyCardArray: story card list.
 *
 * @return:
 */
+ (void)saveStoryCardList:(NSArray *)storyCardArray {
  
    NSString *filePath = [FileUtility getpathForFileName:STORY_CARD_OBJECT_FILE_PATH];
    if (storyCardArray) {
        
        [NSKeyedArchiver archiveRootObject:storyCardArray toFile:filePath];
    }
}

/**
 * Summary: getStoryCardList
 * This method is fetch story card list.
 *
 * @return: Story Card Lsit
 */
+ (NSArray *)getStoryCardList {
    
    NSArray *storyCardList = [NSArray array];
    
    NSString *filePath = [FileUtility getpathForFileName:STORY_CARD_OBJECT_FILE_PATH];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        storyCardList = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    
    return storyCardList;
    
}

@end
