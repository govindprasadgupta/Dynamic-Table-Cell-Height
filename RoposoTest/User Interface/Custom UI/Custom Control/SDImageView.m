/**
 *  SDImageView.m
 *  RoposoTest
 *  Purpose: This class is inhertied from image view and used to set default properites for image view
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "SDImageView.h"
#import "BusinessUtility.h"

@implementation SDImageView

/**
 * Summary: layoutSubviews
 * This method is set layout for view after loading
 *
 * @return:
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.backgroundColor = [BusinessUtility getRandomColor];
}

@end
