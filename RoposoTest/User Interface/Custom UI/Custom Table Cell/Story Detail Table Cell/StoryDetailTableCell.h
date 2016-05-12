/**
 *  StoryDetailTableCell.h
 *  RoposoTest
 *  Purpose: This table view cell class is used for displaying story detail
 *
 *  Created by Govind Gupta on 5/4/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


#import "BaseTableViewCell.h"
#import "StoryCard.h"

@interface StoryDetailTableCell : BaseTableViewCell

/**
 * Summary: setStoryDetailForStoryCard:
 * This method is used to set view according to given story card
 *
 * @param $storyCard: Story card object
 *
 * @return:
 */
- (void)setStoryDetailForStoryCard:(StoryCard *)storyCard;

/**
 * Summary: getStoryDetailCellHeightForStoryCard:
 * This method is used to get dynamically table cell height
 *
 * @param $storyCard: Story card object
 *
 * @return: table row height
 */
+ (CGFloat)getStoryDetailCellHeightForStoryCard:(StoryCard *)storyCard;

@end
