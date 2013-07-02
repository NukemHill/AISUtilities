//
//  UIImage+ImageUtils.m
//  Pandora
//
//  Created by Gregory Hill on 1/12/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "UIImage+ImageUtils.h"

@implementation UIImage (ImageUtils)

+ (UIImage *) drawText: (NSString *)text
			   inImage: (UIImage *)image
			   atPoint: (CGPoint)point
				  font: (UIFont *)font
				 color: (UIColor *)color {
	//
	CGSize imageSize = image.size;

    UIGraphicsBeginImageContext(imageSize);

    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    [color set];
    [text drawInRect:CGRectIntegral(rect) withFont:font];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return newImage;
}

+ (UIImage *) drawText: (NSString *)text
			   inImage: (UIImage *)image
			   atPoint: (CGPoint)point
				  font: (UIFont *)font {
	//
	return [UIImage drawText: text
					 inImage: image
					 atPoint: point
						font: font
					   color: [UIColor whiteColor]];
}

+ (UIImage *) drawText: (NSString *)text
			   inImage: (UIImage *)image
			   atPoint: (CGPoint)point
			  fontSize: (CGFloat)size {
	//
    UIFont *font = [UIFont boldSystemFontOfSize:size];

	return [UIImage drawText:text inImage:image atPoint:point font:font];
}

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);

    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);

    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);

    CGContextSetAlpha(ctx, alpha);

    CGContextDrawImage(ctx, area, self.CGImage);

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return newImage;
}

- (UIImage *) rotateImageByDegrees:(CGFloat)degrees {
	CGImageRef imageRef = [self CGImageRotatedByAngle: [self CGImage]
												angle: degrees];

	UIImage* img = [UIImage imageWithCGImage: imageRef];

	return img;
}

- (CGImageRef)CGImageRotatedByAngle: (CGImageRef)imgRef
							  angle: (CGFloat)angle {
	//
    CGFloat angleInRadians = angle * (M_PI / 180);
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);

    CGRect imgRect = CGRectMake(0, 0, width, height);
    CGAffineTransform transform = CGAffineTransformMakeRotation(angleInRadians);
    CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, transform);

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    CGContextRef bmContext = CGBitmapContextCreate(NULL,
                                                   rotatedRect.size.width,
                                                   rotatedRect.size.height,
                                                   8,
                                                   0,
                                                   colorSpace,
                                                   kCGImageAlphaPremultipliedFirst);
    CGContextSetAllowsAntialiasing(bmContext, YES);
    CGContextSetShouldAntialias(bmContext, YES);
    CGContextSetInterpolationQuality(bmContext, kCGInterpolationHigh);
    CGColorSpaceRelease(colorSpace);
    CGContextTranslateCTM(bmContext,
                          +(rotatedRect.size.width/2),
                          +(rotatedRect.size.height/2));
    CGContextRotateCTM(bmContext, angleInRadians);
    CGContextTranslateCTM(bmContext,
                          -(rotatedRect.size.width/2),
                          -(rotatedRect.size.height/2));
    CGContextDrawImage(bmContext, CGRectMake(0, 0,
                                             rotatedRect.size.width,
                                             rotatedRect.size.height),
                       imgRef);



    CGImageRef rotatedImage = CGBitmapContextCreateImage(bmContext);
    CFRelease(bmContext);

    return rotatedImage;
}


- (UIImage *) crop:(CGRect)rect {
    rect = CGRectMake(rect.origin.x * self.scale,
                      rect.origin.y * self.scale,
                      rect.size.width * self.scale,
                      rect.size.height * self.scale);

    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);

	UIImage *result = [UIImage imageWithCGImage: imageRef
                                          scale: self.scale
                                    orientation: self.imageOrientation];

    CGImageRelease(imageRef);

	return result;
}

- (UIImage *) cropWithInsetX:(CGFloat)xInset insetY:(CGFloat)yInset {
	CGRect frame = (CGRect){CGPointZero, self.size};

	frame = CGRectInset(frame, xInset, yInset);

	return [self crop:frame];
}


@end
