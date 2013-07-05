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
			requestType: (WebServiceRequestType)requestType {
	//
	self = [super init];

	if(self) {
		_requestType = requestType;
		
		_responseCodeObject = [WebServiceResponseValidator createResponseValidatorObject: response];
		
		_validResponse = YES;

		_responseCodeObject.controller = self;

		[_responseCodeObject validateResponse];

		NSString *title;

/**
 1. Web calls
 2. AJAX calls
 3. Web API
 */
		switch (requestType) {
//			case loginRequestType:
//				title = NSLocalizedString(@"loginValidatorDialogTitle", @"Error Logging In");
//
//				break;
//
//			case logoutRequestType:
//				title = NSLocalizedString(@"logoutValidatorDialogTitle", @"Error Logging Out");
//
//				break;
//				
//			case fetchAppUpdateStatusRequestType:
//				title = NSLocalizedString(@"updateAppValidatorDialogTitle", @"Error Updating App");
//
//				break;
//
//			case selectStoreRequestType:
//				title = NSLocalizedString(@"selectingStoreValidatorDialogTitle", @"Error Selecting Store");
//
//				break;
//				
//			case fetchCartRequestType:
//				title = NSLocalizedString(@"loadingCartValidatorDialogTitle", @"Error Loading Cart");
//
//				break;
//				
//			case fetchStoresRequestType:
//				title = NSLocalizedString(@"loadingStoresValidatorDialogTitle", @"Error Loading Store List");
//
//				break;
//				
//			case fetchInventoryRequestType:
//				title = NSLocalizedString(@"loadingProductsValidatorDialogTitle", @"Error Loading Products");
//
//				break;
//				
//			case updateCartRequestType:
//				title = NSLocalizedString(@"updatingCartValidatorDialogTitle", @"Error Updating Cart");
//
//				break;
//				
//			case fetchCartForCheckoutRequestType:
//				title = NSLocalizedString(@"loadingCheckoutOptionsValidatorDialogTitle", @"Error Loading Checkout Options");
//
//				break;
//				
//			case fetchFacetsRequestType:
//				title = NSLocalizedString(@"loadingFacetsValidatorDialogTitle", @"Error Loading Filter Options");
//
//				break;
//				
//			case checkoutRequestType:
//				title = NSLocalizedString(@"checkingOutValidatorDialogTitle", @"Error Checking Out");
//
//				break;
//				
//			case emptyCartRequestType:
//				title = NSLocalizedString(@"emptyingCartValidatorDialogTitle", @"Error Emptying Cart");
//
//				break;

			default:
				break;
		}

		self.validatedResponseTitle = title;
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
	NSString *errorMessage;

	NSString *function = @"";
	
	switch (self.requestType) {
//		case loginRequestType: {
//			function = NSLocalizedString(@"loginValidatorFunctionName", @"Login");
//		}
//			break;
//
//		case logoutRequestType: {
//			function = NSLocalizedString(@"logoutValidatorFunctionName", @"Logout");
//		}
//			break;
//
//		case fetchAppUpdateStatusRequestType:
//			function = NSLocalizedString(@"fetchAppUpdateValidatorFunctionName", @"App Update");
//
//			break;
//
//		case fetchCartRequestType: {
//			function = NSLocalizedString(@"loadCartValidatorFunctionName", @"Load Shopping Cart");
//		}
//			break;
//
//		case fetchStoresRequestType: {
//			function = NSLocalizedString(@"loadStoresValidatorFunctionName", @"Load Stores");
//		}
//			break;
//
//		case selectStoreRequestType: {
//			function = NSLocalizedString(@"selectStoresValidatorFunctionName", @"Select Store");
//		}
//			break;
//
//		case fetchFacetsRequestType: {
//			function = NSLocalizedString(@"loadFiltersValidatorFunctionName", @"Load Search Filters");;
//		}
//			break;
//
//		case fetchInventoryRequestType: {
//			function = NSLocalizedString(@"loadProductsValidatorFunctionName", @"Load Products");
//		}
//			break;
//
//		case emptyCartRequestType: {
//			function = NSLocalizedString(@"emptyCartValidatorFunctionName", @"Empty Cart");
//		}
//			break;
//
//		case updateCartRequestType: {
//			function = NSLocalizedString(@"emptyCartValidatorFunctionName", @"Update Cart");
//		}
//			break;
//
//		case fetchCartForCheckoutRequestType: {
//			function = NSLocalizedString(@"loadStoreOptionsValidatorFunctionName", @"Load Store Checkout Options");
//		}
//			break;
//
//		case checkoutRequestType: {
//			function = NSLocalizedString(@"checkoutValidatorFunctionName", @"Checkout");
//		}
//			break;

	   default: {
		   function = NSLocalizedString(@"unknownValidatorFunctionName", @"Unknown Function");
	   }
			break;
	}

	errorMessage = [NSString stringWithFormat:@"%@ (%@)", coreMsg, function];

	NSString *responseErrorMessage;

	NSError *error;

	NSDictionary *respDict = [NSJSONSerialization JSONObjectWithData: self.response.rawData
															 options: kNilOptions
															   error: &error];

	if(respDict) {
		responseErrorMessage = [respDict valueForKey:@"message"];

		NSString *headerStr = NSLocalizedString(@"responseErrorHeader", @"Response Error");
		
		errorMessage = [NSString stringWithFormat:@"%@ %@: %@", errorMessage, headerStr, responseErrorMessage];
	}

	return errorMessage;
}


@end
