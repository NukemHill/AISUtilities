//
//  UIColor+HexToRGB.m
//  Pandora
//
//  Created by Gregory Hill on 1/28/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "UIColor+HexToRGB.h"

@implementation UIColor (HexToRGB)

+ (UIColor *)getUIColorObjectFromHexString: (NSString *)hexStr
									 alpha: (CGFloat)alpha {
	//
	// Convert hex string to int
	unsigned int hexint = [self intFromHexString:hexStr];

	// Create color object, specifying alpha as well
	UIColor *color;

	CGFloat redColor = ((CGFloat)((hexint & 0xFF0000) >> 16)) / 255;
	CGFloat greenColor = ((CGFloat)((hexint & 0xFF00) >> 8)) / 255;
	CGFloat blueColor = ((CGFloat)(hexint & 0xFF)) / 255;

	color = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:alpha];

	return color;
}

+ (unsigned int) intFromHexString:(NSString *)hexStr {
	unsigned int hexInt = 0;

	// Create scanner
	NSScanner *scanner = [NSScanner scannerWithString:hexStr];

	// Tell scanner to skip the # character
	[scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];

	[scanner scanHexInt:&hexInt];

	return hexInt;
}

@end
