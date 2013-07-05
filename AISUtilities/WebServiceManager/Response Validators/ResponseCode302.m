//
//  ResponseError302.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode302.h"

#import "AISWebServiceResponse.h"


@implementation ResponseCode302

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response302NoFailure;
		
		_controller.validResponse = YES;
	}

	return self;
}

- (void) validateResponse {
}


@end
