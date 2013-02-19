//
//  NSObject+IncompleteException.m
//  Pandora
//
//  Created by Gregory Hill on 12/21/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "NSObject+IncompleteException.h"

#import "IncompleteImplementationException.h"


@implementation NSObject (IncompleteException)

- (NSException *) incompleteExceptionWithMethod:(NSString *)methodName {
	NSException	*exception = [IncompleteImplementationException exceptionWithClass:[self class] method:methodName];

	return exception;
}


@end
