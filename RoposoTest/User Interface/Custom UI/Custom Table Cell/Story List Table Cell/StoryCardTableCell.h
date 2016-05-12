/**
 *  StoryCardTableCell.h
 *  RoposoTest
 *  Purpose: This table view cell class is used for displaying story cards
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#define STORY_CELL_TABLE_HEIGHT                              400
#define STORY_CELL_CARD_IMAGE_HEIGHT                         196.5

#import "BaseTableViewCell.h"
#import "StoryCard.h"
#import "RoposoUser.h"

@protocol StoryCardTableCellDelegate <NSObject>

/**
 * Summary: updateTableViewCellView:
 * This method is used to update table view
 *
 * @return:
 */
- (void)updateTableViewCellView;

@end

@interface StoryCardTableCell : BaseTableViewCell

/**
 * Summary: setStoryDetailForStoryCard:withRelatedUserandTarget:
 * This method is used to set view according to given story card and user object
 *
 * @param $storyCard: Story card object
 * @param $roposoUser: Roposo user object.
 * @param $target: delegate class.
 *
 * @return:
 */
- (void)setStoryDetailForStoryCard:(StoryCard *)storyCard
                   withRelatedUser:(RoposoUser *)roposoUser
                         andTarget:(id)target;
@end
