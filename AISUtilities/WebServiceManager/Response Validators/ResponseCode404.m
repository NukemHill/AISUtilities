//
//  ResponseError404.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode404.h"

#import "AISWebServiceResponse.h"


/**
 •	404 (Not Found)
	- The URL or the item in question was not found
 */

@implementation ResponseCode404

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response404InvalidURLError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code404DialogMessage", @"The function you are trying to use is unavailable. Please notify the system administrator.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];

	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
