/**
 *  FileUtility.m
 *  RoposoTest
 *  Purpose: This utility class is used to perform file related method
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import "FileUtility.h"
#import "RoposoDOConstant.h"
#import "RoposoUser+Helper.h"
#import "StoryCard+Helper.h"

@implementation FileUtility

/**
 * Summary: parseAndSaveInputJson
 * This method is used to parse and save input Json file
 *
 * @return:
 */
+ (void)parseAndSaveInputJson {
    
    if ([RoposoUser getRoposoUserList].count > 0 ||
        [StoryCard getStoryCardList].count > 0) { //Already parsed and save
      
        NSLog(@"Json file is already parsed");
    } else { //First time app launch
       
        NSString *inputFilePath = [[NSBundle mainBundle] pathForResource:@"InputData" ofType:@"json"];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:inputFilePath]) { //Checking input file exist
            
            NSData *inputData = [NSData dataWithContentsOfFile:inputFilePath];
            
            NSError *error = nil;
            id responseData = [NSJSONSerialization JSONObjectWithData:inputData options:0 error:&error];
            if (error) { //Json input is not valid
                
                NSLog(@"JSon file is not in proper format");
                
            } else { //Json input is valid
                
                NSMutableArray *userList = [NSMutableArray array];
                NSMutableArray *storyCardList = [NSMutableArray array];
                for (NSDictionary *inputInfo in responseData) {
                    
                    if ([inputInfo valueForKey:USER_NAME_JSON_KEY]) { //Roposo user
                        
                        RoposoUser *roposoUSer = [RoposoUser createAndSaveRoposoUserWithInfo:inputInfo];
                        [userList addObject:roposoUSer];
                    } else if ([inputInfo valueForKey:CARD_DESCRIPTION_JSON_KEY]) { //Story card
                        
                        StoryCard *storyCard = [StoryCard createAndSaveStoryCardWithInfo:inputInfo];
                        [storyCardList addObject:storyCard];
                    }
                }
                
                [RoposoUser saveRoposoUserList:userList]; //Saving users
                [StoryCard saveStoryCardList:storyCardList]; //Saving story cards
            }
            
        }

    }
}

/**
 * Summary: getpathForFileName:
 * This method is used to get path for given file file
 *
 * @param $fileName: file name
 *
 * @return: file path
 */
+ (NSString *)getpathForFileName:(NSString *)fileName {
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) firstObject];
    NSString *applicationName = [[[NSBundle mainBundle] infoDictionary] valueForKey:(id)kCFBundleNameKey];
    NSString *applicationStorePath = [documentPath stringByAppendingPathComponent:applicationName];
    
    NSString *filePath = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:applicationStorePath]) { //Folder is not exist
        
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:applicationStorePath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&error];
        if (error) { //Folder creation fail
            
            filePath = nil;
            NSLog(@"Not able to create folder at path for reason = %@",error.localizedDescription);
        } else { //Folder created sucessfully
            
            filePath = [applicationStorePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
        }
    } else { //Folder is already exist
        
        filePath = [applicationStorePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    }
    
    
    return [applicationStorePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
}


@end
