//
//  NSString+Trim.m
//  Pandora
//
//  Created by Gregory Hill on 2/6/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "NSString+Trim.h"

@implementation NSString (Trim)

- (NSString *) trimWhiteSpace {
	NSString *finalString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

	return finalString;
}


@end
