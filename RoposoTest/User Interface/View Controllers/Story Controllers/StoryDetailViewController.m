/**
 *  StoryDetailViewController.m
 *  RoposoTest
 *  Purpose: This view controller class is used to show story and related user detail and perform related operation
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "StoryDetailViewController.h"
#import "UserDetailTableCell.h"
#import "StoryDetailTableCell.h"
#import "FileConstant.h"
#import "SDImageView.h"
#import "UIImageView+WebCache.h"
#import "UIStringConstant.h"
#import "RoposoUser+Helper.h"

#define STORY_DETAIL_SECTION                0
#define USER_DETAIL_SECTION                 1

@interface StoryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tblStoryDetailView;

@end

@implementation StoryDetailViewController

/**
 * Summary: viewDidLoad
 * This method is called after the view is set
 *
 * @return:
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
  
    self.navigationItem.title = _storyCard.storyTitle;
    [self setTableHeaderView];
}

/**
 * Summary: setTableHeaderView
 * This method is used to set table header view
 *
 * @return:
 */
- (void)setTableHeaderView {
   
    __block SDImageView *headerImageView = [[SDImageView alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.view.frame.size.width, 200)];
    
    [headerImageView sd_setImageWithURL:[NSURL URLWithString:_storyCard.imageHref]
                       placeholderImage:nil
                                options:SDWebImageRetryFailed
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                  
                                  
                                  CGFloat cellWidth = [[UIScreen mainScreen] bounds].size.width;
                                  CGFloat cellHeight = ((image.size.height *cellWidth)/image.size.width);
                                  headerImageView.frame = CGRectMake(0, 0, cellWidth, cellHeight);
                                  self.tblStoryDetailView.tableHeaderView = headerImageView;
                                  
                                  
                              }];
    
    self.tblStoryDetailView.tableHeaderView = headerImageView;
}

#pragma mark - Table view data source methods

/**
 * Summary: numberOfSectionsInTableView:
 * This method is used to get number of section for given table view
 *
 * @param $tableView: Table view.
 *
 * @return: number of section in table view
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

/**
 * Summary: tableView:numberOfRowsInSection:
 * This method is used to define number of rows in a table view
 *
 * @param $tableView: Table view.
 * @param $section: Table section.
 *
 * @return:number of rows
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

/**
 * Summary: tableView:cellForRowAtIndexPath:
 * This method is used to create a cell for given index path
 *
 * @param $tableView: Table view.
 * @param $indexPath: Index path.
 *
 * @return: Table cell object
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tableCell = nil;
    
    switch (indexPath.section) {
        case STORY_DETAIL_SECTION: {
            
            StoryDetailTableCell *storyDetailCell  = [self.tblStoryDetailView dequeueReusableCellWithIdentifier:STORY_DETAIL_TABLE_CELL_IDENTIFIER];
            
            if(!storyDetailCell) {
                storyDetailCell =  (StoryDetailTableCell *)[StoryDetailTableCell loadTableViewCellFromNib];
                
            }
            
            [storyDetailCell setStoryDetailForStoryCard:self.storyCard];
            tableCell = storyDetailCell;
        }
            break;
        case USER_DETAIL_SECTION: {
            
            UserDetailTableCell *userDetailCell  = [self.tblStoryDetailView dequeueReusableCellWithIdentifier:USER_DETAIL_TABLE_CELL_IDENTIFIER];
            
            if(!userDetailCell) {
                userDetailCell =  (UserDetailTableCell *)[UserDetailTableCell loadTableViewCellFromNib];
                
            }
            
            [userDetailCell setUserDetailForRoposoUser:self.roposoUser];
            tableCell = userDetailCell;
        }
            break;
        default:
            break;
    }
    
    
    return tableCell;
}

/**
 * Summary: tableView:titleForHeaderInSection:
 * This method is used to set title for header
 *
 * @param $tableView: Table view.
 * @param $section: Section.
 *
 * @return: Header title
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *headerTitle = nil;
    switch (section) {
        case USER_DETAIL_SECTION:
            
            headerTitle = SLVC_AUTHER_TITLE_TEXT;
            break;
        default:
            break;
    }
    return headerTitle;
}

/**
 * Summary: tableView:viewForFooterInSection:
 * This method is used to used to create table section header
 *
 * @param $tableView: Table view.
 * @param $section: Table section.
 *
 * @return: Follow button footer view
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footerView = nil;
    
    switch (section) {
        case USER_DETAIL_SECTION: {
            
            UIButton *followButton = [UIButton buttonWithType:UIButtonTypeCustom];
            followButton.frame = CGRectMake(0, 0, self.navigationController.view.frame.size.width, 50);
            followButton.backgroundColor = [UIColor greenColor];
            [followButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (self.roposoUser.isFollowing) {
                
                [followButton setTitle:SLVC_UNFOLLOW_BTN_TEXT forState:UIControlStateNormal];
            } else {
                
                [followButton setTitle:SLVC_FOLLOW_BTN_TEXT forState:UIControlStateNormal];
            }
            
            [followButton addTarget:self action:@selector(followButtonPressed) forControlEvents:UIControlEventTouchUpInside];
            footerView = followButton;
        }
            break;
        default:
            break;
    }
    
    return footerView;
}


#pragma mark - Table view delegate methods

/**
 * Summary: tableView:heightForRowAtIndexPath:
 * This method is used to set height of a table row
 *
 * @param $tableView: Table view.
 * @param $indexPath: Index path.
 *
 * @return: table row height
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    CGFloat tableRowHeight = CGFLOAT_MIN;
    switch (indexPath.section) {
        case STORY_DETAIL_SECTION:
            
            tableRowHeight = [StoryDetailTableCell getStoryDetailCellHeightForStoryCard:self.storyCard];
            break;
        case USER_DETAIL_SECTION:
            
            tableRowHeight = USER_DETAIL_CELL_TABLE_HEIGHT;
            break;
        default:
            break;
        }
    return tableRowHeight;
}

/**
 * Summary: tableView:heightForHeaderInSection:
 * This method is used to set height of a header for a section in a table view
 *
 * @param $tableView: Table view.
 * @param $section: Table section.
 *
 * @return: table header height
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    CGFloat headerHeight = CGFLOAT_MIN;
    switch (section) {
        case USER_DETAIL_SECTION:
            
            headerHeight = 50;
            break;
        default:
            break;
    }
    return headerHeight;
}

/**
 * Summary: tableView:heightForFooterInSection:
 * This method is used to set height of a footer for a section in a table view
 *
 * @param $tableView: Table view.
 * @param $section: Table section.
 *
 * @return: table footer height
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    CGFloat footerHeight = CGFLOAT_MIN;
    switch (section) {
        case USER_DETAIL_SECTION:
            
            footerHeight = 50;
            break;
        default:
            break;
    }
    return footerHeight;
}

#pragma mark - UI control methods

/**
 * Summary: followButtonPressed
 * This method is called on user tapping on follow button
 *
 * @return:
 */
- (void)followButtonPressed {
    
    self.roposoUser.isFollowing = !self.roposoUser.isFollowing;
    [RoposoUser updateRoposoUserListForUser:self.roposoUser];
    [self.tblStoryDetailView reloadSections:[NSIndexSet indexSetWithIndex:USER_DETAIL_SECTION]
                           withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
