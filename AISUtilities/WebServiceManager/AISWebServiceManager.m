//
//  PandoraWebServiceManager.m
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "AISWebServiceManager.h"

//#import "PandoraLoginRequest.h"
//#import "PandoraLogoutRequest.h"
//#import "PandoraFetchUpdateStatusRequest.h"
//#import "PandoraFetchCartRequest.h"
//#import "PandoraGetStoresRequest.h"
//#import "PandoraSelectStoreRequest.h"
//#import "PandoraFetchFacetsRequest.h"
//#import "PandoraFetchInventoryRequest.h"
//#import "PandoraEmptyCartRequest.h"
//#import "PandoraUpdateCartRequest.h"
//#import "PandoraCheckoutOptionsRequest.h"
//#import "PandoraCheckoutRequest.h"

#import "WebServiceResponseValidator.h"
#import "ResponseCode200.h"
#import "ResponseCode302.h"


@implementation AISWebServiceManager

@synthesize requestType			= _requestType;
@synthesize request				= _request;
@synthesize delegate			= _delegate;


+ (id) serviceWithDictionary: (NSDictionary *)requestFormatDict
				 requestType: (int)wsRequestType
					 baseURL: (NSString *)baseURL {
	//
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;

	return nil;

}

+ (id) serviceWithDictionary: (NSDictionary *)requestFormatDict
				 requestType: (int)requestType
					 baseURL: (NSString *)baseURL
					 isProxy: (BOOL)isProxy {
	//
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;

	return nil;
}



- (void) submitRequest {
	[self.request submitRequestWithResponseListener:self];
}

- (void) responseComplete:(AISWebServiceResponse *)response {
////	[response responseInfo:ResponseHeaderFields + ResponseCookies];
//
//	WebServiceResponseValidator *responseValidator = [[WebServiceResponseValidator alloc] initWithResponse: response
//																							   requestType: self.requestType];
//
//	response.responseValidator = responseValidator;
//
//	[self.delegate webServiceResponse:response];
}

- (void) responseFailed:(AISWebServiceResponse *)response {
	[self.delegate webServiceResponse:response];
}


@end
