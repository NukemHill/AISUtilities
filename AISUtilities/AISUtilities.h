//
//  AISUtilities.h
//  AISUtilities
//
//  Created by Gregory Hill on 2/18/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AISUtilities/DebugLog.h>
#import <AISUtilities/IncompleteImplementationException.h>
#import <AISUtilities/NSDate+Formatter.h>
#import <AISUtilities/NSDecimalNumber+Price.h>
#import <AISUtilities/NSDictionary+ObjectAtIndex.h>
#import <AISUtilities/NSObject+IncompleteException.h>
#import <AISUtilities/NSString+Trim.h>
#import <AISUtilities/NSString+URLEncoding.h>
#import <AISUtilities/SynthesizeSingleton.h>
#import <AISUtilities/TimerUtility.h>

#import <AISUtilities/AISMenuController.h>
#import <AISUtilities/AISBaseMenuTableViewCell.h>

#import <AISUtilities/WebServiceDefs.h>
#import <AISUtilities/AISWebServiceManager.h>
#import <AISUtilities/AISWebServiceRequest.h>
#import <AISUtilities/WebServiceGetRequest.h>
#import <AISUtilities/WebServicePostRequest.h>
#import <AISUtilities/WebServicePutRequest.h>
#import <AISUtilities/WebServiceDeleteRequest.h>
#import <AISUtilities/AISWebServiceResponse.h>
#import <AISUtilities/LegacyHttpResponse.h>
#import <AISUtilities/ValidatedAJAXResponse.h>
#import <AISUtilities/WebApiResponse.h>

#import <AISUtilities/WebServiceResponseValidator.h>
#import <AISUtilities/ResponseCode200.h>
#import <AISUtilities/ResponseCode302.h>
#import <AISUtilities/ResponseCode401.h>
#import <AISUtilities/ResponseCode403.h>
#import <AISUtilities/ResponseCode404.h>
#import <AISUtilities/ResponseCode408.h>
#import <AISUtilities/ResponseCode412.h>
#import <AISUtilities/ResponseCode500.h>
#import <AISUtilities/ResponseCode503.h>

#import <AISUtilities/AISRootDataManager.h>
#import <AISUtilities/AISRootDataCollection.h>


#define		kTimeoutInMinutes		20.0f
