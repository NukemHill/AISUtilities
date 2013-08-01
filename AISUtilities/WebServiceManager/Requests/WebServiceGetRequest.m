//
//  WebServiceGetRequest.m
//  AISConnectionManager
//
//  Created by Gregory Hill on 5/31/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import "WebServiceGetRequest.h"

@interface WebServiceGetRequest()
@end

@implementation WebServiceGetRequest

- (id) initWithURLString:(NSString *)urlString {
	self = [super initWithURLString:urlString];

	if(self) {

	}

	return self;
}

- (void) buildWithDictionary:(NSDictionary *)dictionary {
	[super buildWithDictionary:dictionary];

	self.queryString = @"";

	NSDictionary *queryParams = [dictionary valueForKey:@"queryStringParams"];

	NSString *queryString = [self buildStringWithDictionary:queryParams];

	self.queryString = queryString;

	//	DebugLog(@"queryString: %@", queryString);
}


- (NSString *) buildStringWithDictionary:(NSDictionary *)dictionary {
	NSString *str = @"";

	BOOL isMore = NO;

	NSArray *allKeys = [dictionary allKeys];

	for(NSString *key in allKeys) {
		if(isMore)
			str = [str stringByAppendingString:@"&"];

		isMore = YES;

		NSString *val = [dictionary valueForKey:key];

		NSString *param = [NSString stringWithFormat:@"%@=%@", key, val];

		str = [str stringByAppendingString:param];
	}

	return str;
}

- (void) submitRequestWithResponseListener:(id<ResponseListener>)responseListener {
	self.urlRequest.HTTPMethod = @"GET";
	[self.urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	
	if(self.queryString.length > 0) {
		NSString *fullQueryString = [self.urlString stringByAppendingFormat:@"?%@", self.queryString];

		NSURL *url = [NSURL URLWithString:fullQueryString];

		self.serviceURL = url;
	}

	[super submitRequestWithResponseListener:responseListener];
}

@end
