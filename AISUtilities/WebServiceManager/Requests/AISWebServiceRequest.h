//
//  PandoraRequest.h
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WebServiceDefs.h"
#import "AISWebServiceResponse.h"


@interface AISWebServiceRequest : NSObject

@property (strong, nonatomic) NSMutableURLRequest	*urlRequest;

@property (strong, nonatomic) NSString				*urlString;
@property (assign, nonatomic) BOOL					isProxyURL;
@property (strong, nonatomic) NSURL					*serviceURL;
@property (assign, nonatomic) RequestMethod			requestMethod;
@property (strong, nonatomic) NSMutableArray		*cookies;

@property (strong, nonatomic) AISWebServiceResponse	*response;


+ (id) requestWithURLString:(NSString *)urlString;

+ (id) requestWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary;

+ (id) requestWithURLString: (NSString *)urlString
				 dictionary: (NSDictionary *)dictionary
					isProxy: (BOOL)isProxy;

- (id) initWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary;

- (id) initWithURLString:(NSString *)urlString;

- (void) buildWithDictionary:(NSDictionary *)dictionary;

- (void) submitRequestWithResponseListener:(id<ResponseListener>)responseListener;

- (NSString *) buildStringWithDictionary:(NSDictionary *)dictionary;

@end
