//
//  NSDate+Formatter.h
//  Pandora
//
//  Created by Gregory Hill on 2/5/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

- (NSString *) dateToString;

+ (NSArray *) availableDatesArray:(NSArray *)dateStrings;


@end
