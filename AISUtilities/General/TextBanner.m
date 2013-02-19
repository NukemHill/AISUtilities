//
//  TextBanner.m
//  Pandora
//
//  Created by Gregory Hill on 2/15/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "TextBanner.h"

#import "BannerView.h"
#import "UIImage+ImageUtils.h"

@interface TextBanner()

@property (nonatomic, strong) UIFont		*bannerFont;

@end

@implementation TextBanner

- (id) initWithString: (NSString *)bannerString
			 viewSize: (CGSize)viewSize
		  displaySize: (CGSize)displaySize
			 rotation: (CGFloat)rotation
		gradientArray: (NSArray *)gradientArray {
	//
	self = [super init];

	if(self) {
		_bannerString = bannerString;
		_viewSize = viewSize;
		_displaySize = displaySize;
		_rotation = rotation;
		_gradientArray = gradientArray;

		UIFont *font = [UIFont fontWithName:kBannerFontStyle size:kBannerFontSize];

		_bannerFont = font;

		[self createRotatedBanner];
	}

	return self;
}

- (void) createRotatedBanner {
	CGRect frame = (CGRect){CGPointZero, self.viewSize};

	//@[[UIColor yellowColor], [UIColor whiteColor], [UIColor yellowColor]]
	BannerView *bannerView = [[BannerView alloc] initWithFrame:frame gradientArray:self.gradientArray];

	[bannerView setNeedsLayout];

	UIImage *bannerViewImage = [bannerView imageFromView];

	CGSize stringSize = [self.bannerString sizeWithFont:self.bannerFont];

	CGFloat xPos = (frame.size.width - stringSize.width) / 2;
	CGFloat yPos = (frame.size.height - stringSize.height) / 2;

	CGPoint drawPoint = (CGPoint){xPos, yPos};

	UIImage *rawBannerImage = [UIImage drawText: self.bannerString
										inImage: bannerViewImage
										atPoint: drawPoint
										   font: self.bannerFont
										  color: [UIColor blackColor]];

	UIImage *rotatedImage = [rawBannerImage rotateImageByDegrees:self.rotation];

	rotatedImage = [rotatedImage cropWithInsetX:30.0f insetY:20.0f];

	CGSize imageSize = rotatedImage.size;

    UIGraphicsBeginImageContext(imageSize);

	CGRect finalBannerFrame = (CGRect){CGPointZero, self.displaySize};
	
	BannerView *finalBannerView = [[BannerView alloc] initWithFrame:finalBannerFrame gradientArray:nil];

	UIImage *finalImage = [finalBannerView imageFromView];

    [finalImage drawInRect:(CGRect){CGPointZero, finalImage.size}];
	
    CGRect rect = (CGRect){CGPointZero, rotatedImage.size};//(point.x, point.y, image.size.width, image.size.height);

    [rotatedImage drawInRect:CGRectIntegral(rect)];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

	_bannerImage = newImage;
}

@end
