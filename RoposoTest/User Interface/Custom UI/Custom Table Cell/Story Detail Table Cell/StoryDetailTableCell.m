/**
 *  UserDetailTableCell.m
 *  RoposoTest
 *  Purpose: This table view cell class is used for displaying story card detail
 *
 *  Created by Govind Gupta on 5/4/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


#import "StoryDetailTableCell.h"
#import "SDImageView.h"
#import "UIImageView+WebCache.h"
#import "UIStringConstant.h"
#import "NSString+Utility.h"

#define STORY_DETAIL_CELL_TABLE_HEIGHT                              116

@interface StoryDetailTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblLiked;
@property (weak, nonatomic) IBOutlet UILabel *lblLikes;
@property (weak, nonatomic) IBOutlet UILabel *lblComments;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnStoryLink;

/**
 * Summary: linkButtonPressed:
 * This method is called on user tapping href button and navigate to safari
 *
 * @param $sender: story link button
 *
 * @return:
 */
- (IBAction)linkButtonPressed:(id)sender;

@end

@implementation StoryDetailTableCell

/**
 * Summary: setStoryDetailForStoryCard:
 * This method is used to set view according to given story card
 *
 * @param $storyCard: Story card object
 *
 * @return:
 */
- (void)setStoryDetailForStoryCard:(StoryCard *)storyCard {
    
    [self.lblLikes setText:[NSString stringWithFormat:SLVC_COMMENTS_LABEL_TEXT,storyCard.commentCount]];
    [self.lblComments setText:[NSString stringWithFormat:SLVC_LIKES_LABEL_TEXT,storyCard.likeCount]];
    [self.lblDescription setText:storyCard.storyDescription];
    self.btnStoryLink.titleLabel.numberOfLines = 2;
    [self.btnStoryLink setTitle:storyCard.storyURL forState:UIControlStateNormal];
    if (storyCard.isLike) {
        
        self.lblLiked.text = SLVC_LIKED_LABEL_TEXT;
    } else {
        
        self.lblLiked.text = SLVC_NOT_LIKED_LABEL_TEXT;
    }
}

/**
 * Summary: linkButtonPressed:
 * This method is called on user tapping href button and navigate to safari
 *
 * @param $sender: story link button
 *
 * @return:
 */
- (IBAction)linkButtonPressed:(id)sender {
    
    NSURL *url = [NSURL URLWithString:self.btnStoryLink.titleLabel.text];
    
    if (![[UIApplication sharedApplication] openURL:url]) {
        
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    }
}

/**
 * Summary: getStoryDetailCellHeightForStoryCard:
 * This method is used to get dynamically table cell height
 *
 * @param $storyCard: Story card object
 *
 * @return: table row height
 */
+ (CGFloat)getStoryDetailCellHeightForStoryCard:(StoryCard *)storyCard {
    
    
    CGFloat cellWidth = [[UIScreen mainScreen] bounds].size.width - 20;
    CGSize textSize = [storyCard.storyDescription getExactSizeForTextSize:CGSizeMake(cellWidth, CGFLOAT_MAX)
                                                                  andFont:[UIFont preferredFontForTextStyle:UIFontTextStyleCallout]];
    return (STORY_DETAIL_CELL_TABLE_HEIGHT + textSize.height);
}

@end
