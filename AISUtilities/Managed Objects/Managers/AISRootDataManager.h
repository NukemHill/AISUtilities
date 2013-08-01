//
//  PandoraDataManager.h
//  Pandora
//
//  Created by Gregory Hill on 2/9/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

/* Comments:
 - All of the Managers inherit from PandoraDataManager.
 - PandoraDataManager acts as the WebServiceDelegate for processing all of the web app api calls made 
	by the child classes.
 - All of the child classes are Singletons (using the SYNTHESIZE_SINGLETON_FOR_CLASS() macro defined 
	in SynthesizeSingleton.h).  This, combined with defining short pre-processor macros for each manager, 
	makes universal calls to these managers and their functionality very easy.  For example:
		[PandoraLoginManager sharedPandoraLoginManager] is redefined as Login.  So, a call to the logout 
		method becomes "[Login logout];".
 */

#import <Foundation/Foundation.h>

//#import "DataProcessingAlertView.h"


@interface AISRootDataManager : NSObject <WebServiceDelegate/*, ProcessingAlertDelegate*/>

/**
 *	requestType must actually be created in the specific child implementation of a Data Manager
 */
//@property (nonatomic, assign) WebServiceRequestType		requestType;

@property (nonatomic, assign) BOOL						validResponse;


- (void) submitRequest:(NSDictionary *)requestDictionary;

- (void) submitRequest:(NSDictionary *)requestDictionary withURL:(NSString *)urlString;

- (void) processResponse:(AISWebServiceResponse *)response;

- (void) presentRetryAlertWithResponse:(AISWebServiceResponse *)response;

- (void) presentRetryCancelAlertWithResponse:(AISWebServiceResponse *)response;

@end
