//
//  ResponseError503.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode503.h"

#import "AISWebServiceResponse.h"


/**
 •	503 (Service Unavailable)
	- Might happen when the web app is not there, or being redeployed or something
 */

@implementation ResponseCode503

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response503ServiceUnavailableError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code503DialogMessage", @"The service is currently unavailable. Please try again shortly.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];

	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
