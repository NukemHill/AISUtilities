//
//  WebServiceDeleteRequest.m
//  AISConnectionManager
//
//  Created by Gregory Hill on 5/31/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import "WebServiceDeleteRequest.h"

@implementation WebServiceDeleteRequest


- (id) initWithURLString:(NSString *)urlString {
	self = [super initWithURLString:urlString];

	if(self) {

	}

	return self;
}

- (void) submitRequestWithResponseListener:(id<ResponseListener>)responseListener {
	self.urlRequest.HTTPMethod = @"DELETE";
	[self.urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

//	if(self.queryString.length > 0) {
//		NSString *fullQueryString = [self.urlString stringByAppendingFormat:@"?%@", self.queryString];
//
//		NSURL *url = [NSURL URLWithString:fullQueryString];
//
//		self.serviceURL = url;
//	}

	[super submitRequestWithResponseListener:responseListener];
}


@end
