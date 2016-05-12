/**
 *  BusinessUtility.m
 *  RoposoTest
 *  Purpose: This utility class is used to perform rule validation.
 *
 *  Created by Govind Gupta on 5/3/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


#import "BusinessUtility.h"

@implementation BusinessUtility

/**
 * Summary: validateStringTypeDetail:
 * This method is used to check object is string type
 *
 * @param $nodeDetail: object
 *
 * @return: String validation
 */
+ (BOOL)validateStringTypeDetail:(id)nodeDetail {
    
    BOOL isValidDetail = NO;
    if (nodeDetail &&
        nodeDetail != [NSNull null] &&
        [nodeDetail isKindOfClass:[NSString class]]) {
        
        isValidDetail = YES;
    }
    return isValidDetail;
}

/**
 * Summary: validateNumberTypeDetail:
 * This method is used to check object is NSNumber type
 *
 * @param $nodeDetail: object
 *
 * @return: Number validation
 */
+ (BOOL)validateNumberTypeDetail:(id)nodeDetail {
    
    BOOL isValidDetail = NO;
    if (nodeDetail &&
        nodeDetail != [NSNull null] &&
        [nodeDetail isKindOfClass:[NSNumber class]]) {
        
        isValidDetail = YES;
    }
    return isValidDetail;
}

/**
 * Summary: getRandomColor:
 * This method is used to get random color value
 *
 * @return: Random color
 */
+ (UIColor *)getRandomColor {
    
    CGFloat redValue = arc4random()%255;
    CGFloat greenValue = arc4random()%255;
    CGFloat blueValue = arc4random()%255;
    
    UIColor *randomColor = [UIColor colorWithRed:redValue/255.0f
                                           green:greenValue/255.0f
                                            blue:blueValue/255.0f alpha:0.1f];
    
    return randomColor;
}

@end
