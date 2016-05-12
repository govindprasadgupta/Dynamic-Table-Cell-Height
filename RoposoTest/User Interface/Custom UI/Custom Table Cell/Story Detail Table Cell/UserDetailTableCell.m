/**
 *  UserDetailTableCell.m
 *  RoposoTest
 *  Purpose: This table view cell class is used for displaying story card detail
 *
 *  Created by Govind Gupta on 5/4/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


#import "UserDetailTableCell.h"
#import "SDImageView.h"
#import "UIImageView+WebCache.h"
#import "UIStringConstant.h"

@interface UserDetailTableCell ()

@property (weak, nonatomic) IBOutlet SDImageView *imgViewUserIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblFollowerFollowing;
@property (weak, nonatomic) IBOutlet UILabel *lblPageHandle;
@property (weak, nonatomic) IBOutlet UILabel *lblUserDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnProfileHref;
@property (weak, nonatomic) IBOutlet UILabel *lblFollowing;

/**
 * Summary: linkButtonPressed:
 * This method is called on user tapping href button and navigate to safari
 *
 * @param $sender: User link button
 *
 * @return:
 */
- (IBAction)linkButtonPressed:(id)sender;

@end

@implementation UserDetailTableCell

/**
 * Summary: setUserDetailForRoposoUser:
 * This method is used to set view according to given roposo user
 *
 * @param $roposoUser: Roposo user object
 *
 * @return:
 */
- (void)setUserDetailForRoposoUser:(RoposoUser *)roposoUser {
    
    [self.imgViewUserIcon sd_setImageWithURL:[NSURL URLWithString:roposoUser.imageHref]];
    [self.lblUserName setText:roposoUser.userName];
    NSString *followText = [NSString stringWithFormat:SLVC_FOLLOWING_FOLLOWER_TEXT,roposoUser.userFollowing,roposoUser.userFollowers];
    [self.lblFollowerFollowing setText:followText];
    [self.lblPageHandle setText:roposoUser.userHandle];
    [self.lblUserDescription setText:roposoUser.aboutUser];
    self.btnProfileHref.titleLabel.numberOfLines = 2;
    [self.btnProfileHref setTitle:roposoUser.profileHref forState:UIControlStateNormal];
    NSString *firstNameOfUser = [[roposoUser.userName componentsSeparatedByString:@" "] firstObject];
    if (roposoUser.isFollowing) {
        
        self.lblFollowing.text = [NSString stringWithFormat:SDVC_FOLLOWING_LABEL_TEXT,firstNameOfUser];
    } else {
       
        self.lblFollowing.text = [NSString stringWithFormat:SLVC_NOT_FOLLOWING_LABEL_TEXT,firstNameOfUser];
    }
    
    
}

/**
 * Summary: linkButtonPressed:
 * This method is called on user tapping href button and navigate to safari
 *
 * @param $sender: User link button
 *
 * @return:
 */
- (IBAction)linkButtonPressed:(id)sender {
    
    NSURL *url = [NSURL URLWithString:self.btnProfileHref.titleLabel.text];
    
    if (![[UIApplication sharedApplication] openURL:url]) {
        
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    }
}
@end
