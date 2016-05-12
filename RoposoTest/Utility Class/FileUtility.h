/**
 *  FileUtility.h
 *  RoposoTest
 *  Purpose: This utility class is used to perform file related method
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


#import <Foundation/Foundation.h>

@interface FileUtility : NSObject

/**
 * Summary: parseAndSaveInputJson
 * This method is used to parse and save input Json file
 *
 * @return:
 */
+ (void)parseAndSaveInputJson;

/**
 * Summary: getpathForFileName:
 * This method is used to get path for given file file
 *
 * @param $fileName: file name
 *
 * @return: file path
 */
+ (NSString *)getpathForFileName:(NSString *)fileName;

@end
