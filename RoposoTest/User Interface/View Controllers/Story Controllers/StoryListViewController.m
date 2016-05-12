/**
 *  StoryListViewController.m
 *  RoposoTest
 *  Purpose: This view controller class is used for displaying story cards and perform related operation
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "StoryListViewController.h"
#import "StoryCard+Helper.h"
#import "RoposoUser+Helper.h"
#import "StoryCardTableCell.h"
#import "FileConstant.h"
#import "StoryDetailViewController.h"
#import "UIStringConstant.h"
#import "SDWebImageManager.h"

@interface StoryListViewController () {
    
    NSArray *storyCardList; //Storing all cards
    NSArray *roposoUserList; //Storing all users
}

@property (weak, nonatomic) IBOutlet UITableView *tblStoryCardView;

@end

@implementation StoryListViewController

/**
 * Summary: viewDidLoad
 * This method is called after the view is set
 *
 * @return:
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    storyCardList = [StoryCard getStoryCardList];
    roposoUserList = [RoposoUser getRoposoUserList];
    self.navigationItem.title = SLVC_NAV_ITEM_TITLE;
}

/**
 * Summary: viewWillAppear:
 * This method is called when the view is about to made visible
 *
 * @param $animated: Animation state.
 *
 * @return:
 */
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.tblStoryCardView reloadData];
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
    
    return storyCardList.count;
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
    
    StoryCardTableCell *storyCardCell  = [self.tblStoryCardView dequeueReusableCellWithIdentifier:STORY_CARD_TABLE_CELL_IDENTIFIER];
    
    if(!storyCardCell) {
        storyCardCell =  (StoryCardTableCell *)[StoryCardTableCell loadTableViewCellFromNib];
        
    }
    
    StoryCard *storyCard = [storyCardList objectAtIndex:indexPath.section];
    
    NSPredicate *roposoUserPredicate = [NSPredicate predicateWithFormat:@"%K ==[c] %@",ASSOCIATED_USER_PREDICATE_TEXT,storyCard.associatedUser];
    RoposoUser *roposoUser = [[roposoUserList filteredArrayUsingPredicate:roposoUserPredicate] firstObject];
    
    [storyCardCell setStoryDetailForStoryCard:storyCard
                              withRelatedUser:roposoUser
                                    andTarget:self];
    return storyCardCell;
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
    
    StoryCard *storyCard = [storyCardList objectAtIndex:indexPath.section];
    UIImage *storyImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:storyCard.imageHref];
    
    CGFloat tableHeight = STORY_CELL_TABLE_HEIGHT;
    if (storyImage) {
        
        CGFloat cellWidth = [[UIScreen mainScreen] bounds].size.width - 20;
        CGFloat imageHeight = ((storyImage.size.height * cellWidth)/storyImage.size.width);
        tableHeight = (STORY_CELL_TABLE_HEIGHT - STORY_CELL_CARD_IMAGE_HEIGHT + imageHeight);
    }
    
    return tableHeight;
}

/**
 * Summary: tableView:didSelectRowAtIndexPath:
 * This method is called after selecting a cell
 *
 * @param $tableView: Table view.
 * @param $indexPath: Index path.
 *
 * @return:
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StoryDetailViewController *storyDetailController = [[StoryDetailViewController alloc] initWithNibName:STORY_DETAILCONTROLLER_NIB_NAME bundle:nil];
    StoryCard *storyCard = [storyCardList objectAtIndex:indexPath.section];
    storyDetailController.storyCard = storyCard;
    NSPredicate *roposoUserPredicate = [NSPredicate predicateWithFormat:@"%K ==[c] %@",ASSOCIATED_USER_PREDICATE_TEXT,storyCard.associatedUser];
    storyDetailController.roposoUser = [[roposoUserList filteredArrayUsingPredicate:roposoUserPredicate] firstObject];
    [self.navigationController pushViewController:storyDetailController
                                         animated:YES];
}

#pragma mark - StoryCardTableCellDelegate methods

/**
 * Summary: updateTableViewCellView:
 * This method is used to update table view
 *
 * @return:
 */
- (void)updateTableViewCellView {
    
    [self.tblStoryCardView beginUpdates];
    [self.tblStoryCardView endUpdates];
    
    
}

@end
