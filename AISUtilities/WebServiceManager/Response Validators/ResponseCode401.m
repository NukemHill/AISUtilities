//
//  ResponseError401.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode401.h"

#import "AISWebServiceResponse.h"


/**
 •	401 (Unauthorized)
	- The user is not authenticated (most likely)
 */

@implementation ResponseCode401

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response401AuthenticationError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code401DialogMessage", @"You need to logout and log back in.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];
	
	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
