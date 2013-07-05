//
//  PandoraRequest.m
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "AISWebServiceRequest.h"

#import "WebServiceGetRequest.h"
#import "WebServicePostRequest.h"
#import "WebServicePutRequest.h"
#import "WebServiceDeleteRequest.h"


@implementation AISWebServiceRequest

@synthesize pandoraURLString	= _pandoraURLString;
@synthesize isProxyURL			= _isProxyURL;
@synthesize serviceURL			= _pandoraURL;
@synthesize requestMethod		= _requestMethod;
@synthesize cookies				= _cookies;
@synthesize postParams			= _postParams;
@synthesize postString			= _postString;
@synthesize queryString			= _queryString;


+ (id) requestWithURLString:(NSString *)urlString {
	AISWebServiceRequest *request = [[AISWebServiceRequest alloc] init];

	if(request) {
		request.pandoraURLString = urlString;
		request.serviceURL = [NSURL URLWithString:urlString];
	}

	return request;
}

+ (id) requestWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary {
	return nil;
}

+ (id) requestWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary isProxy:(BOOL)isProxy {
	return nil;
}

- (id) initWithURLString:(NSString *)urlString {
	self = [super init];

	if(self) {
		self.pandoraURLString = urlString;
		self.serviceURL = [NSURL URLWithString:urlString];
	}

	return self;
}

- (id) initWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary {
	return nil;
}



- (RequestMethod) requestMethodFromString:(NSString *)requestMethod {
	RequestMethod method;

	if([requestMethod isEqualToString:@"POST"])
		method = requestPost;
	else if([requestMethod isEqualToString:@"GET"])
		method = requestGet;
	else if([requestMethod isEqualToString:@"PUT"])
		method = requestPut;
	else if([requestMethod isEqualToString:@"DELETE"])
		method = requestDelete;
	else
		method = requestUnknown;

	return method;
}

- (void) buildWithDictionary:(NSDictionary *)dictionary {
	self.requestMethod = [self requestMethodFromString:[dictionary valueForKey:@"requestMethod"]];
	
	self.cookies = [NSMutableArray arrayWithArray:COOKIES];

	self.postString = @"";
	self.queryString = @"";

	switch(self.requestMethod) {
		case requestPost: {
			self.postParams = [NSMutableDictionary dictionaryWithDictionary:[dictionary valueForKey:@"postParams"]];

			break;
		}
			
		case requestGet: {
			NSDictionary *queryParams = [dictionary valueForKey:@"queryStringParams"];

			[self buildGetString:queryParams];

			break;
		}

		case requestPut:

			break;

		case requestDelete:

			break;

		case requestUnknown:
		default:
			break;
	}
}

- (void) buildPostString {
	NSString *postString = [self buildStringWithDictionary:self.postParams encode:NO];
	self.postString = postString;

//	DebugLog(@"postString: %@", postString);
}

- (void) buildGetString:(NSDictionary *)dictionary {
	NSString *queryString = [self buildStringWithDictionary:dictionary encode:YES];

	self.queryString = queryString;

//	DebugLog(@"queryString: %@", queryString);
}

- (NSString *) buildStringWithDictionary:(NSDictionary *)dictionary encode:(BOOL)encode {
	NSString *str = @"";
	
	BOOL isMore = NO;

	NSArray *allKeys = [dictionary allKeys];

	for(NSString *key in allKeys) {
		if(isMore)
			str = [str stringByAppendingString:@"&"];

		isMore = YES;

		NSString *val = [dictionary valueForKey:key];
		if(encode) {
			val = [val urlEncodeUsingEncoding:NSUTF8StringEncoding];
		}

		NSString *param = [NSString stringWithFormat:@"%@=%@", key, val];

		str = [str stringByAppendingString:param];
	}

	return str;
}

- (void) buildSpecificRequestWithDictionary:(NSDictionary *)dictionary {
	
}




//- (id) initWithURLString:(NSString *)urlString requestMethod:(RequestMethod)requestMethod cookie:(NSString *)cookie {
//	self = [super init];
//
//	if(self) {
//		self.pandoraURLString = urlString;
//		self.pandoraURL = [NSURL URLWithString:urlString];
//		self.requestMethod = requestMethod;
//		self.cookie = cookie;
//	}
//
//	return self;
//}

- (void) submitRequestWithRequestType: (WebServiceRequestType)requestType
					 responseListener: (id<ResponseListener>)responseListener {
	//
	AISWebServiceResponse *response = [AISWebServiceResponse responseWithRequestType:requestType];
	response.responseListener = responseListener;
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

	// NOTE: this is absolutely the wrong way to do this.  Need to reexamine the cookie management.
//	NSString *langCookieKey = @"_lang";
//	NSString *langCookieValue = [Language currentLanguage];
//
//	NSDictionary *langCookieProps = @{NSHTTPCookieName : langCookieKey,
//								   NSHTTPCookieValue : langCookieValue,
//								   NSHTTPCookieDomain : Globals.baseURL,
//								   NSHTTPCookiePath : @"/",
//								   NSHTTPCookieVersion : @"0",
//								   NSHTTPCookieExpires : [[NSDate date] dateByAddingTimeInterval:2629743]};
//
//	NSHTTPCookie *langCookie = [NSHTTPCookie cookieWithProperties:langCookieProps];
//	
//	[[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:langCookie];

	self.cookies = [NSMutableArray arrayWithArray:COOKIES];

	if([self.cookies count] > 0) {
		NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:self.cookies];
		[request setAllHTTPHeaderFields:headers];
	}

	switch (self.requestMethod) {
		case requestGet: {
			if(self.queryString.length > 0) {
				NSString *fullQueryString = [self.pandoraURLString stringByAppendingFormat:@"?%@", self.queryString];

				NSURL *url = [NSURL URLWithString:fullQueryString];

				self.serviceURL = url;
			}
		}

			break;

		case requestPost: {
			if(self.postString.length > 0) {
				NSData *postData = [self.postString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
				NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];

				[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
				[request setHTTPBody:postData];
			}

			request.HTTPMethod = @"POST";
			[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
		}

			break;

		default:

			break;
	}

	request.URL = self.serviceURL;

	[NSURLConnection connectionWithRequest:request delegate:response];
}


@end
