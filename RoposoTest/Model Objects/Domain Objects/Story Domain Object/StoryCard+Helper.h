/**
 *  StoryCard+Helper.h
 *  RoposoTest
 *  Purpose: This helper category is used to perform action related to StoryCard model.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


#import "StoryCard.h"

@interface StoryCard (Helper)

/**
 * Summary: createAndSaveStoryCardWithInfo:
 * This method is used to create and save StoryCard object for given information.
 *
 * @param $storyCardInfo: StoryCard information
 *
 * @return: StoryCard object
 */
+ (StoryCard *)createAndSaveStoryCardWithInfo:(NSDictionary *)storyCardInfo;

/** Summary: saveStoryCardList:
 *  This method is used to save story card in plist.
 *
 * @param $storyCardArray: story card list.
 *
 * @return:
 */
+ (void)saveStoryCardList:(NSArray *)storyCardArray;

/**
 * Summary: getStoryCardList
 * This method is fetch story card list.
 *
 * @return: Story Card Lsit
 */
+ (NSArray *)getStoryCardList;


@end
