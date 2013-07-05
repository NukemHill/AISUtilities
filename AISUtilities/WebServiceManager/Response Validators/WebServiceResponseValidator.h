//
//  WebServiceResponseValidator.h
//  AIS
//
//  Created by Gregory Hill on 1/31/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WebServiceDefs.h"


typedef enum {
	FailedConnectionError,
	InvalidLoginError,
	Response401AuthenticationError,
	Response403ForbiddenAccessError,
	Response404InvalidURLError,
	Response408RequestTimeoutError,
	Response412PreconditionError,
	Response500InternalServerError,
	Response503ServiceUnavailableError,
	Response200NoFailure,
	Response302NoFailure,
	ResponseDataValidationError
} FailedDataProcessingReasons;


@protocol ResponseCode;

@class AISWebServiceResponse;


@interface WebServiceResponseValidator : NSObject

@property (nonatomic, assign, getter = isValidResponse) BOOL	validResponse;

@property (nonatomic, strong) NSString							*validatedResponseTitle;

@property (nonatomic, strong) NSString							*validatedResponseMessage;

@property (nonatomic, strong) id<ResponseCode>					responseCodeObject;

@property (nonatomic, assign) WebServiceRequestType				requestType;

@property (nonatomic, strong) AISWebServiceResponse				*response;


- (id) initWithResponse: (AISWebServiceResponse *)response
			requestType: (WebServiceRequestType)requestType;

+ (id<ResponseCode>) createResponseValidatorObject: (AISWebServiceResponse *)response;

- (NSString *) errorMessageWithCoreMessage:(NSString *)coreMsg;


@end


@protocol ResponseCode

@property (nonatomic, strong) WebServiceResponseValidator		*controller;

- (id<ResponseCode>) initWithResponse:(AISWebServiceResponse *)response;

- (void) validateResponse;


@end