//
//  TextBanner.h
//  Pandora
//
//  Created by Gregory Hill on 2/15/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBannerFontSize			20.0f
#define kBannerFontStyle		@"ArialHebrew-Bold"

@interface TextBanner : NSObject

@property (nonatomic, strong) UIImage	*bannerImage;

@property (nonatomic, strong) NSString	*bannerString;
@property (nonatomic, assign) CGSize	viewSize;
@property (nonatomic, assign) CGSize	displaySize;
@property (nonatomic, assign) CGFloat	rotation;
@property (nonatomic, strong) NSArray	*gradientArray;


- (id) initWithString: (NSString *)bannerString
			 viewSize: (CGSize)viewSize
		  displaySize: (CGSize)displaySize
			 rotation: (CGFloat)rotation
		gradientArray: (NSArray *)gradientArray;

@end
