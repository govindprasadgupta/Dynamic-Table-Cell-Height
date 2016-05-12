/**
 *  UIStringConstant.h
 *  RoposoTest
 *  Purpose: This constant file is used to store all UI string constant
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#define		MAIN_BUNDLE                             [NSBundle mainBundle]

#pragma mark - StoryListViewController

#define   SLVC_FOLLOWING_FOLLOWER_TEXT               NSLocalizedStringWithDefaultValue(@"1001",nil,MAIN_BUNDLE,@"%d Following %d Follower",@"Follower following string format")
#define   SLVC_NAV_ITEM_TITLE                        NSLocalizedStringWithDefaultValue(@"1002",nil,MAIN_BUNDLE,@"Story Feed",@"Story list nav title")
#define   SLVC_FOLLWOING_STATUS_TEXT                 NSLocalizedStringWithDefaultValue(@"1003",nil,MAIN_BUNDLE,@"✓ Following", @"Following status text")

#pragma mark - StoryDetailViewController

#define   SDVC_FOLLOWING_LABEL_TEXT                 NSLocalizedStringWithDefaultValue(@"1101",nil,MAIN_BUNDLE,@"You are following to %@",@"User following string format")
#define   SLVC_NOT_FOLLOWING_LABEL_TEXT             NSLocalizedStringWithDefaultValue(@"1102",nil,MAIN_BUNDLE,@"You are not following to %@",@"USer not following string format")
#define   SLVC_FOLLOW_BTN_TEXT                      NSLocalizedStringWithDefaultValue(@"1103",nil,MAIN_BUNDLE,@"FOLLOW",@"Follow btn text")
#define   SLVC_UNFOLLOW_BTN_TEXT                    NSLocalizedStringWithDefaultValue(@"1104",nil,MAIN_BUNDLE,@"UNFOLLOW",@"Unfollow btn text")
#define   SLVC_NOT_LIKED_LABEL_TEXT                 NSLocalizedStringWithDefaultValue(@"1105",nil,MAIN_BUNDLE,@"Not Liked",@"Not liked text")
#define   SLVC_LIKED_LABEL_TEXT                     NSLocalizedStringWithDefaultValue(@"1106",nil,MAIN_BUNDLE,@"Liked",@"Liked text")
#define   SLVC_LIKES_LABEL_TEXT                     NSLocalizedStringWithDefaultValue(@"1107",nil,MAIN_BUNDLE,@"%d Like(s)",@"Likes text format")
#define   SLVC_COMMENTS_LABEL_TEXT                  NSLocalizedStringWithDefaultValue(@"1108",nil,MAIN_BUNDLE,@"%d Comment(s)", @"Comment text format")
#define   SLVC_AUTHER_TITLE_TEXT                    NSLocalizedStringWithDefaultValue(@"1109",nil,MAIN_BUNDLE,@"Auther Details", @"Auther detail header text")