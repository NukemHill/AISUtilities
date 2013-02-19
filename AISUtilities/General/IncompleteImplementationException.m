//
//  IncompleteImplementationException.m
//  Pandora
//
//  Created by Gregory Hill on 12/21/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "IncompleteImplementationException.h"

@implementation IncompleteImplementationException

+ (NSException *) exceptionWithClass:(Class)class method:(NSString *)method {
	NSString *className = NSStringFromClass(class);
	NSString *reason = [NSString stringWithFormat:@"%@ ust be implemented in a subclass of %@", method, className];

	NSException *exception = [NSException exceptionWithName:@"Incomplete Implementation" reason:reason userInfo:nil];

	return exception;
}


@end
