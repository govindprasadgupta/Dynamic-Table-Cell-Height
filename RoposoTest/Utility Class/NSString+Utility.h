/**
 *  NSString+Utility.h
 *  RoposoTest
 *  Purpose: This class is a category class which is used to provide more functionality to NSString class.
 *
 *  Created by Govind Gupta on 5/3/16..
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface NSString (Utility)

/**
 * Summary: getExactSizeForTextSize: andFont:
 * This method is used to get string height for given string width and font size
 *
 * @param $size: String size
 * @param $font: String font
 *
 * @return: String size
 */
- (CGSize)getExactSizeForTextSize:(CGSize)size
                          andFont:(UIFont *)font;


@end
