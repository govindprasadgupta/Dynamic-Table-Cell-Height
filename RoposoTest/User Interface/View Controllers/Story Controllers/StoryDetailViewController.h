/**
 *  StoryDetailViewController.h
 *  RoposoTest
 *  Purpose: This view controller class is used to show story and related user detail and perform related operation
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "StoryCard.h"
#import "RoposoUser.h"

@interface StoryDetailViewController : UIViewController

@property (nonatomic,weak) StoryCard *storyCard;
@property (nonatomic,weak) RoposoUser *roposoUser;
@end
