//
//  PandoraResponse.h
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceDefs.h"

#import "WebServiceResponseValidator.h"


typedef enum {
	ResponseStatusCode	= 1,
	ResponseHeaderFields = 2,
	ResponseCookies = 4,
	ResponseRawData = 8,
	ResponseNothing = 0
} ResponseDataTypes;



@protocol ResponseListener;

@protocol LegacyHttpProtocolDataParser;

@protocol ValidatedAjaxDataParser;

@protocol WebApiDataParser;


@interface AISWebServiceResponse : NSObject <NSURLConnectionDelegate>

@property (assign, nonatomic) NSInteger						statusCode;
@property (strong, nonatomic) NSDictionary					*headerFields;
@property (strong, nonatomic) NSArray						*cookies;

@property (strong, nonatomic) NSMutableData					*rawData;
@property (strong, nonatomic) NSString						*dataString;

@property (strong, nonatomic) id<ResponseListener>			responseListener;

@property (nonatomic, strong) WebServiceResponseValidator	*responseValidator;

@property (nonatomic, assign, getter = isSuccess) BOOL		success;
@property (nonatomic, strong) NSString						*message;

@property (nonatomic, assign) BOOL							connectionFailed;
@property (nonatomic, strong) NSError						*failureError;

@property (nonatomic, assign) FailedDataProcessingReasons	failureReason;

@property (nonatomic, assign) BOOL							jsonDataExists;
@property (nonatomic, strong) id							jsonData;


+ (AISWebServiceResponse *) responseWithRequestType:(WebServiceRequestType)requestType;

- (void) parseResponse;

- (void) responseInfo:(int)responseInfoTypes;


@end


@protocol ResponseListener <NSObject>

- (void) responseComplete:(AISWebServiceResponse *)response;

- (void) responseFailed:(AISWebServiceResponse *)response;

@end

@protocol LegacyHttpProtocolDataParser <NSObject>

@end

@protocol ValidatedAjaxDataParser <NSObject>

@property (nonatomic, assign, getter = isSuccess) BOOL			success;
@property (nonatomic, strong) NSString							*message;

@end

@protocol WebApiDataParser <NSObject>

@end

