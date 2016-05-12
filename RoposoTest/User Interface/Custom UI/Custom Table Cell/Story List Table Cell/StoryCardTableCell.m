/**
 *  StoryCardTableCell.m
 *  RoposoTest
 *  Purpose: This table view cell class is used for displaying story cards
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "StoryCardTableCell.h"
#import "SDImageView.h"
#import "UIImageView+WebCache.h"
#import "UIStringConstant.h"

@interface StoryCardTableCell ()

@property (weak, nonatomic) IBOutlet SDImageView *imgViewUserIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblFollowerFollowing;
@property (weak, nonatomic) IBOutlet UILabel *lblStoryTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblStoryURL;
@property (weak, nonatomic) IBOutlet UILabel *lblUserFollowing;
@property (weak, nonatomic) IBOutlet SDImageView *imgViewStoryCard;

@end

@implementation StoryCardTableCell

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
                         andTarget:(id)target {
    
    self.imgViewUserIcon.image = nil;
    self.imgViewStoryCard.image = nil;
    [self.imgViewUserIcon sd_setImageWithURL:[NSURL URLWithString:roposoUser.imageHref]];
    [self.lblUserName setText:roposoUser.userName];
    NSString *followText = [NSString stringWithFormat:SLVC_FOLLOWING_FOLLOWER_TEXT,roposoUser.userFollowing,roposoUser.userFollowers];
    [self.lblFollowerFollowing setText:followText];
    [self.lblStoryTitle setText:storyCard.storyTitle];
    [self.lblStoryURL setText:storyCard.storyURL];
    self.lblUserFollowing.hidden = !roposoUser.isFollowing;
    self.lblUserFollowing.text = SLVC_FOLLWOING_STATUS_TEXT;
    
    UIImage *storyImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:storyCard.imageHref];
    if (storyImage) {
        
        self.imgViewStoryCard.image = storyImage;
    } else {
        
        [self.imgViewStoryCard sd_setImageWithURL:[NSURL URLWithString:storyCard.imageHref]
                                 placeholderImage:nil
                                          options:SDWebImageRetryFailed
                                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                            
                                            if (target &&
                                                [target respondsToSelector:@selector(updateTableViewCellView)]) {
                                                
                                                [target updateTableViewCellView];
                                            }
                                            
                                        }];
    }
}

@end
