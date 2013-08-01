//
//  PandoraDataManager.m
//  Pandora
//
//  Created by Gregory Hill on 2/9/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "AISRootDataManager.h"


@implementation AISRootDataManager

- (void) submitRequest:(NSDictionary *)requestDictionary {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;
}

- (void) submitRequest:(NSDictionary *)requestDictionary withURL:(NSString *)urlString {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;
}

- (void) presentRetryAlertWithResponse:(AISWebServiceResponse *)response {
//	NSString *buttonTitle = [CustomAlertView localizedButtonTitleStrings:OkayButtonTitle];
//	
//	[Workflow presentRetryAlertWithResponse: response
//								   delegate: self
//						  cancelButtonTitle: buttonTitle];
}

- (void) presentRetryCancelAlertWithResponse:(AISWebServiceResponse *)response {
//	[Workflow presentRetryAlertWithResponse:response delegate:self];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
// WebServiceDelegate Delegate Methods
- (void) webServiceResponse:(AISWebServiceResponse *)response {
	[self processResponse:response];
}



- (void) processResponse:(AISWebServiceResponse *)response {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;
}


- (void) retryPressed {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;
}

- (void) cancelPressed {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;
}


@end
