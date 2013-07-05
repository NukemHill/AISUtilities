//
//  PandoraValidatedAJAXResponse.m
//  Pandora
//
//  Created by Gregory Hill on 2/10/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "ValidatedAJAXResponse.h"

@implementation ValidatedAJAXResponse


- (void) parseResponse {
	NSError *error;

	NSDictionary *someJSONData = [NSJSONSerialization JSONObjectWithData: self.rawData
																 options: kNilOptions
																   error: &error];

	if(someJSONData) {
		self.success = [[someJSONData valueForKey:@"Success"] boolValue];

		self.message = [someJSONData valueForKey:@"Message"];

		if(self.success) {
			self.jsonData = [someJSONData valueForKey:@"Data"];

			self.jsonDataExists = YES;
		}
	}
}


@end
