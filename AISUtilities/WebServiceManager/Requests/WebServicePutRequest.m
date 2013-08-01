//
//  WebServicePutRequest.m
//  AISConnectionManager
//
//  Created by Gregory Hill on 5/31/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import "WebServicePutRequest.h"

@implementation WebServicePutRequest

- (id) initWithURLString:(NSString *)urlString {
	self = [super initWithURLString:urlString];

	if(self) {

	}

	return self;
}

- (void) put {
	NSString *urlString = [NSString stringWithFormat:@"example.com/users/1.json?user[first_name]=bob"];
	NSURL *fullURL = [NSURL URLWithString:urlString];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:fullURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20];
	[request setHTTPMethod: @"PUT"];
//	self.todoConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//	receivedData = [NSMutableData data];
}

- (void) submitRequestWithResponseListener:(id<ResponseListener>)responseListener {
	self.urlRequest.HTTPMethod = @"PUT";
	[self.urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

	if(self.queryString.length > 0) {
		NSString *fullQueryString = [self.urlString stringByAppendingFormat:@"?%@", self.queryString];

		NSURL *url = [NSURL URLWithString:fullQueryString];

		self.serviceURL = url;
	}

	[super submitRequestWithResponseListener:responseListener];
}


@end
