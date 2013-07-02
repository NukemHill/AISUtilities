//
//  UIColor+ColorToImage.m
//  Pandora
//
//  Created by Gregory Hill on 2/11/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "UIColor+ColorToImage.h"

@implementation UIColor (ColorToImage)

+ (UIImage *) imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
	
    UIGraphicsBeginImageContext(rect.size);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //  [[UIColor colorWithRed:222./255 green:227./255 blue: 229./255 alpha:1] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

	return img;
}


@end
