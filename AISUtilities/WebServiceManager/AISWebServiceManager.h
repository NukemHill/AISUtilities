//
//  PandoraWebServiceManager.h
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

/* Comments:
 - PandoraWebServiceManager is responsible for managing all requests to and responses from the Pandora
	web service api.
 - It uses the Factory design pattern to instantiate requests, based on the api call
	being made.
 - It then spins off a PandoraResponse object that listens for the actual response.
 - Once the response is received (if no timeout occurs), the response is handed off to PandoraResponseValidator
	to validate the response.  Based on the response code (and the actual contents of the response),
	the PandoraDataManager which initiated the request/response cycle (e.g., PandoraLoginManager) is 
	notified of the validity, and the manager is given responsibility for managing it.
 */


#import <Foundation/Foundation.h>

#import "WebServiceDefs.h"
#import "AISWebServiceRequest.h"
#import "AISWebServiceResponse.h"

@protocol WebServiceDelegate;


@interface AISWebServiceManager : NSObject <ResponseListener>

@property (assign, nonatomic) WebServiceRequestType		requestType;
@property (strong, nonatomic) AISWebServiceRequest		*request;
@property (strong, nonatomic) id<WebServiceDelegate>	delegate;


+ (id) serviceWithDictionary: (NSDictionary *)requestFormatDict
				 requestType: (WebServiceRequestType)requestType
					 baseURL: (NSString *)baseURL;

+ (id) serviceWithDictionary: (NSDictionary *)requestFormatDict
				 requestType: (WebServiceRequestType)requestType
					 baseURL: (NSString *)baseURL
					 isProxy: (BOOL)isProxy;

- (void) submitRequest;


@end


@protocol WebServiceDelegate <NSObject>

- (void) webServiceResponse:(AISWebServiceResponse *)response;

@end