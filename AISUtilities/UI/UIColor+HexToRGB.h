//
//  UIColor+HexToRGB.h
//  Pandora
//
//  Created by Gregory Hill on 1/28/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexToRGB)

+ (UIColor *)getUIColorObjectFromHexString: (NSString *)hexStr
									 alpha: (CGFloat)alpha;

@end
