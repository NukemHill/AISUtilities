//
//  ResponseError412.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode412.h"

#import "AISWebServiceResponse.h"


/**
 •	412 (Precondition Failed)
	- Some expected precondition to the action failed (i.e. the expected precondition of “that order is your shopping cart” failed when attempting to add an item to that particular order key)
 */

@implementation ResponseCode412

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response412PreconditionError;
	}

	return self;
}

- (void) validateResponse {
	NSString *errorMessage = NSLocalizedString(@"code412DialogMessage", @"There appears to be a mismatch between what the system is expecting and the information you are providing.");

	errorMessage = [self errorMessageWithCoreMessage:errorMessage];

	_controller.validResponse = NO;

	_controller.validatedResponseMessage = errorMessage;
}


@end
