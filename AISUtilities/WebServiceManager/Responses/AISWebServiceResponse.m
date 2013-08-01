//
//  PandoraResponse.m
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "AISWebServiceResponse.h"

//#import "PandoraLoginResponse.h"
//#import "PandoraFetchUpdateStatusResponse.h"
//#import "PandoraFetchStoresResponse.h"
//#import "PandoraSelectStoreResponse.h"
//#import "PandoraFetchCartResponse.h"
//#import "PandoraCheckoutOptionsResponse.h"
//#import "PandoraFetchFacetsResponse.h"
//#import "PandoraFetchInventoryResponse.h"
//#import "PandoraEmptyCartResponse.h"
//#import "PandoraUpdateCartResponse.h"
//#import "PandoraCheckoutResponse.h"
//#import "PandoraLogoutResponse.h"


@interface AISWebServiceResponse()
@property (strong, nonatomic) NSMutableArray	*dataArray;

@end


@implementation AISWebServiceResponse

//+ (AISWebServiceResponse *) responseWithRequestGenerator:(id<RequestGenerator>generator) {
//	AISWebServiceResponse *response;
//	
//	if(response) {
//		response = [generator responseWithRequestType:requestType];
//	}
//}

- (id) init {
	self = [super init];

	if(self) {
		self.connectionFailed = NO;
		self.rawData = [NSMutableData data];
		self.dataArray = [NSMutableArray array];
	}

	return self;
}

- (void) parseResponse {
	
}



#pragma mark NSURLConnectionDelegate

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;

	self.statusCode = [HTTPResponse statusCode];
    self.headerFields = [HTTPResponse allHeaderFields];
    self.cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.dataArray addObject:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	DebugLog(@"Error with Connection!!!!!");
	DebugLog(@"Error: %@", error);

	_connectionFailed = YES;
	_failureError = error;

	_failureReason = FailedConnectionError;
	_statusCode = 408;

	[self.responseListener responseComplete:self];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
	for(NSData *dataChunk in self.dataArray) {
		[self.rawData appendData:dataChunk];
	}

	[self parseDataString];
}

- (void) parseDataString {
	self.dataString  = [[NSString alloc] initWithData:self.rawData encoding:NSUTF8StringEncoding];

	[self.responseListener responseComplete:self];
}




- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	return YES;
//	return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//	if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
//		if ([trustedHosts containsObject:challenge.protectionSpace.host])
			[challenge.sender useCredential: [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
				 forAuthenticationChallenge: challenge];

	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}


- (void) responseInfo:(int)responseInfoTypes {
	NSString *responseData = @"\n\n";

	if(responseInfoTypes & ResponseStatusCode) {
		responseData = [responseData stringByAppendingFormat:@"Status: %d\n", self.statusCode];
	}

	if(responseInfoTypes & ResponseHeaderFields) {
		responseData = [responseData stringByAppendingFormat:@"Headers: %@\n", self.headerFields];
	}

	if(responseInfoTypes & ResponseCookies) {
		responseData = [responseData stringByAppendingFormat:@"Cookies: %@\n", self.cookies];
	}

	if(responseInfoTypes & ResponseRawData) {
		responseData = [responseData stringByAppendingFormat:@"Raw Data: %@\n", self.rawData];
	}

	DebugLog(@"%@", responseData);
}



@end
