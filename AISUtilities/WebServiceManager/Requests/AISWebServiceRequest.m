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


+ (id) requestWithURLString:(NSString *)urlString {
	AISWebServiceRequest *request = [[AISWebServiceRequest alloc] init];

	if(request) {
		request.urlString = urlString;
		request.serviceURL = [NSURL URLWithString:urlString];
	}

	return request;
}

+ (id) requestWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;

	return nil;
}

+ (id) requestWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary isProxy:(BOOL)isProxy {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;

	return nil;
}

- (id) initWithURLString:(NSString *)urlString {
	self = [super init];

	if(self) {
		self.urlString = urlString;
		self.serviceURL = [NSURL URLWithString:urlString];
		
		self.urlRequest = [[NSMutableURLRequest alloc] init];

	}

	return self;
}

- (id) initWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;

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
}


- (NSString *) buildStringWithDictionary:(NSDictionary *)dictionary {
	NSString *methodName = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];

	NSException	*exception = [self incompleteExceptionWithMethod:methodName];

	@throw exception;

	return nil;
}

- (void) setLanguageCookie {
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
}


- (void) submitRequestWithResponseListener:(id<ResponseListener>)responseListener {
	//
	_response.responseListener = responseListener;

	self.cookies = [NSMutableArray arrayWithArray:COOKIES];

	if([self.cookies count] > 0) {
		NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:self.cookies];
		[_urlRequest setAllHTTPHeaderFields:headers];
	}

	_urlRequest.URL = self.serviceURL;

	[NSURLConnection connectionWithRequest:_urlRequest delegate:_response];
}


@end
