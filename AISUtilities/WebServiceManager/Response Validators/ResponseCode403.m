//
//  ResponseError403.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode403.h"

#import "AISWebServiceResponse.h"


/**
 •	403 (forbidden)
	- Nobody’s allowed to access this, regardless of authentication
 */

@implementation ResponseCode403

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response403ForbiddenAccessError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code403DialogMessage", @"You don't have the authority to execute this function.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];
	
	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
