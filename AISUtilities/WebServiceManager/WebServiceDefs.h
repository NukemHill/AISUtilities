//
//  PandoraServiceDefs.h
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	requestUnknown = 0,
	requestPost,
	requestGet,
	requestPut,
	requestDelete
} RequestMethod;


#define COOKIES [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]

