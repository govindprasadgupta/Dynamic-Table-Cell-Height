/**
 *  BusinessUtility.h
 *  RoposoTest
 *  Purpose: This utility class is used to perform rule validation and functions.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BusinessUtility : NSObject

/**
 * Summary: validateStringTypeDetail:
 * This method is used to check object is string type
 *
 * @param $nodeDetail: object
 *
 * @return: String validation
 */
+ (BOOL)validateStringTypeDetail:(id)nodeDetail;

/**
 * Summary: validateNumberTypeDetail:
 * This method is used to check object is NSNumber type
 *
 * @param $nodeDetail: object
 *
 * @return: Number validation
 */
+ (BOOL)validateNumberTypeDetail:(id)nodeDetail;

/**
 * Summary: getRandomColor:
 * This method is used to get random color value
 *
 * @return: Random color
 */
+ (UIColor *)getRandomColor;

@end
