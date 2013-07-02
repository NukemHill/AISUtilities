//
//  NSString+Encoding.m
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

- (NSString *) urlEncodeUsingEncoding:(NSStringEncoding)encoding {
	NSString *encodedString;

	CFStringRef stringRef = CFURLCreateStringByAddingPercentEscapes(NULL,
															   (CFStringRef)self,
															   NULL,
															   (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
															   CFStringConvertNSStringEncodingToEncoding(encoding));

	encodedString = [NSString stringWithFormat:@"%@", (__bridge NSString *)stringRef];
	
	CFRelease(stringRef);
	
	return encodedString;
}

@end
