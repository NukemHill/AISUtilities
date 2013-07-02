//
//  UIImage+ImageUtils.h
//  Pandora
//
//  Created by Gregory Hill on 1/12/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtils)

+ (UIImage *) drawText: (NSString *)text
			   inImage: (UIImage *)image
			   atPoint: (CGPoint)point
				  font: (UIFont *)font
				 color: (UIColor *)color;

+ (UIImage *) drawText: (NSString *)text
			   inImage: (UIImage *)image
			   atPoint: (CGPoint)point
			  fontSize: (CGFloat)size;

+ (UIImage *) drawText: (NSString *)text
			   inImage: (UIImage *)image
			   atPoint: (CGPoint)point
				  font: (UIFont *)font;


- (UIImage *) imageByApplyingAlpha:(CGFloat)alpha;

- (UIImage *) rotateImageByDegrees:(CGFloat)degrees;

- (UIImage *) crop:(CGRect)rect;

- (UIImage *) cropWithInsetX:(CGFloat)xInset insetY:(CGFloat)yInset;


@end
