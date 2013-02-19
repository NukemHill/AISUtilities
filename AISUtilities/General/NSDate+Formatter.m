//
//  NSDate+Formatter.m
//  Pandora
//
//  Created by Gregory Hill on 2/5/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

- (NSString *) dateToString {
	NSString *dateString;

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"MM/dd/yyyy"];

	dateString = [dateFormatter stringFromDate:self];

	return dateString;
}



+ (NSArray *) availableDatesArray:(NSArray *)dateStrings {
	NSArray *availableDates;

	unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
	NSCalendar *calendar = [NSCalendar currentCalendar];

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];

	NSMutableArray *temp = [NSMutableArray arrayWithCapacity:dateStrings.count];

	for(NSString *dateString in dateStrings) {
		NSDate *availableDate = [dateFormatter dateFromString:dateString];

		NSDateComponents *components = [calendar components: flags
												   fromDate: availableDate];

		NSDate *dateOnly = [calendar dateFromComponents:components];

		[temp addObject:dateOnly];
	}

//	NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"Date" ascending:YES];
//	[temp sortUsingDescriptors:@[sort]];

	availableDates = temp;

	return availableDates;
}



@end
