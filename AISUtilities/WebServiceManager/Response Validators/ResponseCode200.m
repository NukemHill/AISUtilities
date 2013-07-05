//
//  ResponseError200.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ResponseCode200.h"

#import "AISWebServiceResponse.h"


@implementation ResponseCode200

@synthesize requestType;
@synthesize response						= _response;
@synthesize controller						= _controller;


- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;
		self.response.failureReason = Response200NoFailure;
		
		_controller.validResponse = YES;
	}

	return self;
}

- (void) validateResponse {
}


@end
