//
//  WebServicePostRequest.h
//  AISConnectionManager
//
//  Created by Gregory Hill on 5/31/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import "AISWebServiceRequest.h"

@interface WebServicePostRequest : AISWebServiceRequest

@property (strong, nonatomic) NSMutableDictionary	*postParams;

- (void) buildPostString;


@end
