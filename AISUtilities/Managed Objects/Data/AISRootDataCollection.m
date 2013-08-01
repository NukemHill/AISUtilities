//
//  PandoraDataObject.m
//  Pandora
//
//  Created by Gregory Hill on 2/12/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "AISRootDataCollection.h"

//#import "AISWebServiceResponse.h"


@implementation AISRootDataCollection

- (id) initWithResponse:(AISWebServiceResponse *)response {
	self = [super init];

	if(self) {
		self.response = response;

		[self processResponse];
	}

	return self;
}

- (void) processResponse {
	_validResponse = YES;
	
	_connectionFailed = self.response.connectionFailed;
	
	if(_connectionFailed) {
		_validResponse = NO;
		
		self.connectionError = self.response.failureError;
	} else if(!self.response.isSuccess) {
		_validResponse = NO;
		
		self.failureMessage = self.response.message;
	}
}

@end
