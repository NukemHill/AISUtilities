//
//  PandoraWebAPIResponse.m
//  Pandora
//
//  Created by Gregory Hill on 2/10/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "WebApiResponse.h"

@implementation WebApiResponse

- (void) parseResponse {
	NSError *error;

	NSDictionary *pandoraData = [NSJSONSerialization JSONObjectWithData: self.rawData
																options: kNilOptions
																  error: &error];

	if(pandoraData) {
		self.success = YES;
		
		self.jsonData = pandoraData;
		self.jsonDataExists = YES;
	}
}


@end
