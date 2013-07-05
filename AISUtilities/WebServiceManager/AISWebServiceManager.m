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
				 requestType: (WebServiceRequestType)wsRequestType
					 baseURL: (NSString *)baseURL {
	//
	[Timer resetTime];
	
	AISWebServiceManager *manager = [[AISWebServiceManager alloc] init];

	if(manager) {
		manager.requestType = wsRequestType;

		switch (wsRequestType) {
//			case loginRequestType:
//				manager.request = [PandoraLoginRequest requestWithURLString: baseURL
//																 dictionary: requestFormatDict];
//				
//				break;
//
//			case logoutRequestType:
//				manager.request = [[PandoraLogoutRequest alloc] initWithURLString: baseURL
//																	   dictionary: requestFormatDict];
//
//				break;
//
//			case fetchAppUpdateStatusRequestType:
//				manager.request = [[PandoraFetchUpdateStatusRequest alloc] initWithURLString: baseURL
//																				  dictionary: requestFormatDict];
//				
//				break;
//
//			case fetchCartRequestType:
//				manager.request = [[PandoraFetchCartRequest alloc] initWithURLString: baseURL
//																		  dictionary: requestFormatDict];
//
//				break;
//				
//			case fetchStoresRequestType:
//				manager.request = [[PandoraGetStoresRequest alloc] initWithURLString: baseURL
//																		  dictionary: requestFormatDict];
//
//				break;
//				
//			case selectStoreRequestType:
//				manager.request = [[PandoraSelectStoreRequest alloc] initWithURLString: baseURL
//																			dictionary: requestFormatDict];
//
//				break;
//
//			case fetchFacetsRequestType:
//				manager.request = [[PandoraFetchFacetsRequest alloc] initWithURLString: baseURL
//																			dictionary: requestFormatDict];
//
//				break;
//
//			case fetchInventoryRequestType:
//				manager.request = [[PandoraFetchInventoryRequest alloc] initWithURLString: baseURL
//																			   dictionary: requestFormatDict];
//
//				break;
//
//			case emptyCartRequestType:
//				manager.request = [[PandoraEmptyCartRequest alloc] initWithURLString: baseURL
//																		  dictionary: requestFormatDict];
//
//				break;
//
//			case updateCartRequestType:
//				manager.request = [[PandoraUpdateCartRequest alloc] initWithURLString: baseURL
//																		   dictionary: requestFormatDict];
//
//				break;
//				
//			case fetchCartForCheckoutRequestType:
//				manager.request = [[PandoraCheckoutOptionsRequest alloc] initWithURLString: baseURL
//																				dictionary: requestFormatDict];
//
//				break;
//
//			case checkoutRequestType:
//				manager.request = [PandoraCheckoutRequest requestWithURLString: baseURL
//																	dictionary: requestFormatDict];
//
//				break;

			default:
				break;
		}
	}

	return manager;
}

+ (id) serviceWithDictionary: (NSDictionary *)requestFormatDict
				 requestType: (WebServiceRequestType)requestType
					 baseURL: (NSString *)baseURL
					 isProxy: (BOOL)isProxy {
	//

	return nil;
}



- (void) submitRequest {
	[self.request submitRequestWithRequestType:self.requestType responseListener:self];
}

- (void) responseComplete:(AISWebServiceResponse *)response {
//	[response responseInfo:ResponseHeaderFields + ResponseCookies];

	WebServiceResponseValidator *responseValidator = [[WebServiceResponseValidator alloc] initWithResponse: response
																							   requestType: self.requestType];

	response.responseValidator = responseValidator;

	[self.delegate webServiceResponse:response];
}

- (void) responseFailed:(AISWebServiceResponse *)response {
	[self.delegate webServiceResponse:response];
}


@end
