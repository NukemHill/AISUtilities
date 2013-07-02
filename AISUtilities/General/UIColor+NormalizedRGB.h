//
//  UIColor+NormalizedRGB.h
//  Pandora
//
//  Created by Gregory Hill on 2/26/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFilledByte			255.0f

@interface UIColor (NormalizedRGB)

+ (UIColor *) normalizedWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *) normalizedWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end
