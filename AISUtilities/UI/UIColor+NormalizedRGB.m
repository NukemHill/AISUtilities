//
//  UIColor+NormalizedRGB.m
//  Pandora
//
//  Created by Gregory Hill on 2/26/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "UIColor+NormalizedRGB.h"

@implementation UIColor (NormalizedRGB)

+ (UIColor *) normalizedWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
	UIColor *normalizedColor = [UIColor normalizedWithRed:red green:green blue:blue alpha:1.0];

	return normalizedColor;
}

+ (UIColor *) normalizedWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
	UIColor *normalizedColor = [UIColor colorWithRed:(red/kFilledByte) green:(green/kFilledByte) blue:(blue/kFilledByte) alpha:alpha];

	return normalizedColor;
}


@end
