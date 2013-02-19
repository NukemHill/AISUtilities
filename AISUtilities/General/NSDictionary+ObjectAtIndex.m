//
//  NSDictionary+ObjectAtIndex.m
//  Pandora
//
//  Created by Gregory Hill on 12/20/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "NSDictionary+ObjectAtIndex.h"

@implementation NSDictionary (ObjectAtIndex)

- (id) objectAtIndex:(NSInteger)index {
	NSInteger count = 0;
	id object;
	
	for(object in [self allValues]) {
		if(count == index) {
			break;
		}

		count++;
	}

	return object;
}


@end
