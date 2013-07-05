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

@property (strong, nonatomic) NSString				*pandoraURLString;
@property (assign, nonatomic) BOOL					isProxyURL;
@property (strong, nonatomic) NSURL					*serviceURL;
@property (assign, nonatomic) RequestMethod			requestMethod;
@property (strong, nonatomic) NSMutableArray		*cookies;
@property (strong, nonatomic) NSMutableDictionary	*postParams;
@property (strong, nonatomic) NSString				*postString;
@property (strong, nonatomic) NSString				*queryString;


+ (id) requestWithURLString:(NSString *)urlString;

+ (id) requestWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary;

+ (id) requestWithURLString: (NSString *)urlString
				 dictionary: (NSDictionary *)dictionary
					isProxy: (BOOL)isProxy;

- (id) initWithURLString:(NSString *)urlString dictionary:(NSDictionary *)dictionary;


- (id) initWithURLString:(NSString *)urlString;


- (void) buildWithDictionary:(NSDictionary *)dictionary;

- (void) buildPostString;

- (void) buildGetString:(NSDictionary *)dictionary;

- (void) buildSpecificRequestWithDictionary:(NSDictionary *)dictionary;

//- (id) initWithURLString:(NSString *)urlString requestMethod:(RequestMethod)requestMethod cookie:(NSString *)cookie;

- (void) submitRequestWithRequestType:(WebServiceRequestType)requestType responseListener:(id<ResponseListener>)responseListener;


@end
