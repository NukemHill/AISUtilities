//
//  ResponseError408.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode408.h"

#import "AISWebServiceResponse.h"


/**
 •	408 (Request Timeout)
	- Could happen while the web app is spinning up, or too busy
 */

@implementation ResponseCode408

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response408RequestTimeoutError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code408DialogMessage", @"The system appears to be busy. Please try again in a short while.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];

	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
