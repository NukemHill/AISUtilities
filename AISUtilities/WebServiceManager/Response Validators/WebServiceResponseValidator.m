//
//  PandoraResponseError.m
//  Pandora
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "WebServiceResponseValidator.h"

#import "AISWebServiceResponse.h"

#import "ResponseCode200.h"
#import "ResponseCode302.h"

#import "ResponseCode401.h"
#import "ResponseCode403.h"
#import "ResponseCode404.h"
#import "ResponseCode408.h"
#import "ResponseCode412.h"

#import "ResponseCode500.h"
#import "ResponseCode503.h"


@implementation WebServiceResponseValidator

- (id) initWithResponse: (AISWebServiceResponse *)response
			requestType: (int)requestType {
	//

	// semi-abstract method; must be implemented in subclass
	self = [super init];

	if(self) {
		_requestType = requestType;

		_responseCodeObject = [WebServiceResponseValidator createResponseValidatorObject:response];

		_validResponse = YES;

		_responseCodeObject.controller = self;

		[_responseCodeObject validateResponse];
	}

	return self;
}


+ (id<ResponseCode>) createResponseValidatorObject: (AISWebServiceResponse *)response {
	//
	NSInteger statusCode = response.statusCode;

	id<ResponseCode> validatorObject;

	switch (statusCode) {
		case 200: {
			validatorObject = [[ResponseCode200 alloc] initWithResponse:response];
		}
			break;

		case 302: {
			validatorObject = [[ResponseCode302 alloc] initWithResponse:response];
		}
			break;

		case 401: {
			validatorObject = [[ResponseCode401 alloc] initWithResponse:response];
		}
			break;

		case 403: {
			validatorObject = [[ResponseCode403 alloc] initWithResponse:response];
		}
			break;
			
		case 404: {
			validatorObject = [[ResponseCode404 alloc] initWithResponse:response];
		}
			break;
			
		case 408: {
			validatorObject = [[ResponseCode408 alloc] initWithResponse:response];
		}
			break;
			
		case 412: {
			validatorObject = [[ResponseCode412 alloc] initWithResponse:response];
		}
			break;
			
		case 500: {
			validatorObject = [[ResponseCode500 alloc] initWithResponse:response];
		}
			break;
			
		case 503: {
			validatorObject = [[ResponseCode503 alloc] initWithResponse:response];
		}
			break;
			
		default:
			break;
	}

	return validatorObject;
}

- (NSString *) errorMessageWithCoreMessage:(NSString *)coreMsg {
	// abstract method;

	return nil;

}


@end
