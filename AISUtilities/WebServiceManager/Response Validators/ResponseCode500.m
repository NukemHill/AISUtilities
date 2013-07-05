//
//  ResponseError500.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode500.h"

#import "AISWebServiceResponse.h"


/**
 •	500 (Internal Server Error)
	- Generic error in the server… bad things happened.
 */

@implementation ResponseCode500

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response500InternalServerError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code500DialogMessage", @"Oops. There appears to be a serious problem with the server. Please notify the system administrator.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];

	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
