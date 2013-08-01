//
//  WebServicePostRequest.m
//  AISConnectionManager
//
//  Created by Gregory Hill on 5/31/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import "WebServicePostRequest.h"

@interface WebServicePostRequest()
@property (strong, nonatomic) NSString				*postString;
@end

@implementation WebServicePostRequest

- (id) initWithURLString:(NSString *)urlString {
	self = [super initWithURLString:urlString];

	if(self) {

	}

	return self;
}


- (void) buildPostString {
	NSString *postString = [self buildStringWithDictionary:self.postParams];
	self.postString = postString;

	//	DebugLog(@"postString: %@", postString);
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

		// catching non-string encoding exceptions
		@try {
			val = [val urlEncodeUsingEncoding:NSUTF8StringEncoding];
		}
		@catch (NSException *exception) {
		}
		@finally {
		}

		NSString *param = [NSString stringWithFormat:@"%@=%@", key, val];

		str = [str stringByAppendingString:param];
	}

	return str;
}

- (void) submitRequestWithResponseListener:(id<ResponseListener>)responseListener {
	self.urlRequest.HTTPMethod = @"POST";
	[self.urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

	if(self.postString.length > 0) {
		NSData *postData = [self.postString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
		NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];

		[self.urlRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
		[self.urlRequest setHTTPBody:postData];
	}

	[super submitRequestWithResponseListener:responseListener];
}

@end
