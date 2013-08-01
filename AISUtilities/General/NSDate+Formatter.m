//
//  NSDate+Formatter.m
//  Pandora
//
//  Created by Gregory Hill on 2/5/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

/*
 x           number
 xx          two digit number
 xxx         abbreviated name
 xxxx        full name

 a           AM/PM
 A           millisecond of day
 c           day of week (c,cc,ccc,cccc)
 d           day of month
 e           day of week (e,EEE,EEEE)
 F           week of month
 g           julian day (since 1/1/4713 BC)
 G           era designator (G=GGG,GGGG)
 h           hour (1-12, zero padded)
 H           hour (0-23, zero padded)
 L           month of year (L,LL,LLL,LLLL)
 m           minute of hour (0-59, zero padded)
 M           month of year (M,MM,MMM,MMMM)
 Q           quarter of year (Q,QQ,QQQ,QQQQ)
 s           seconds of minute (0-59, zero padded)
 S           fraction of second
 u           zero padded year
 v           general timezone (v=vvv,vvvv)
 w           week of year (0-53, zero padded)
 y           year (y,yy,yyyy)
 z           specific timezone (z=zzz,zzzz)
 Z           timezone offset +0000

 ex:
 @"EEE, dd MMM y HH:mm:ss zzz"	= @"Tue, 08 Jun 2010 17:00:00 EDT"
 @"MM/dd/yyyy HH:mm:ss"			= @"12/01/2013 12:01:00"
 sql         y-M-d H:m:s
 rss         [E, ]d MMM y[y] H:m:s Z|z[zzz]
 */
#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

- (NSString *) dateToString {
	return [self dateToStringWithFormat:@"MM/dd/yyyy HH:mm:ss"];
}

- (NSString *) dateToStringWithFormat:(NSString *)dateFormat {
	NSString *dateString;

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:dateFormat];

	dateString = [dateFormatter stringFromDate:self];

	return dateString;
}

+ (NSDate *) stringToDate:(NSString *)dateString {
	return [self stringToDate:dateString withFormat:@"MM/dd/yyyy HH:mm:ss"];
}

+ (NSDate *) stringToDate:(NSString *)dateString withFormat:(NSString *)dateFormat {
	NSDate *date;

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
//	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setDateFormat:dateFormat];

	date = [dateFormatter dateFromString:dateString];

	return date;

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

- (BOOL) isSameDay:(NSDate *)date1 {
	NSCalendar* calendar = [NSCalendar currentCalendar];

	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
	NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
	NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date1];

	return	[comp1 day]		== [comp2 day] &&
			[comp1 month]	== [comp2 month] &&
			[comp1 year]	== [comp2 year];
}

/**
 *	Got this from: http://stackoverflow.com/questions/5067785/how-do-i-add-1-day-to-a-nsdate
 *					(Zaky German's answer)
 *
 *	@param	dayCount	+/- days to increment
 *	@param	monthCount	+/- months to increment
 *	@param	yearCount	+/- years to increment
 *
 *	@return	the incremented date as NSDate *
 */
- (NSDate *) dateByIncrementingDay:(NSInteger)dayCount month:(NSInteger)monthCount year:(NSInteger)yearCount {
	NSDateComponents *dayComponent = [[NSDateComponents alloc] init];

	dayComponent.day = dayCount;
	dayComponent.month = monthCount;
	dayComponent.year = yearCount;

	NSCalendar *theCalendar = [NSCalendar currentCalendar];
	NSDate *dateToBeIncremented = [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];

	return  dateToBeIncremented;
}


- (BOOL) isSameDayAsDate:(NSDate *)date {
	BOOL isSame = NO;

	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
	NSCalendar *gregorian = [NSCalendar currentCalendar];

	NSDateComponents *comps1 = [gregorian components:unitFlags fromDate:self];
	NSDateComponents *comps2 = [gregorian components:unitFlags fromDate:date];

	isSame = (comps1.day == comps2.day);

	return isSame;
}

- (BOOL) isSameMonthAsDate:(NSDate *)date {
	BOOL isSame = NO;

	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
	NSCalendar *gregorian = [NSCalendar currentCalendar];

	NSDateComponents *comps1 = [gregorian components:unitFlags fromDate:self];
	NSDateComponents *comps2 = [gregorian components:unitFlags fromDate:date];

	isSame = (comps1.month == comps2.month);
	
	return isSame;
}

- (BOOL) isSameYearAsDate:(NSDate *)date {
	BOOL isSame = NO;

	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
	NSCalendar *gregorian = [NSCalendar currentCalendar];

	NSDateComponents *comps1 = [gregorian components:unitFlags fromDate:self];
	NSDateComponents *comps2 = [gregorian components:unitFlags fromDate:date];

	isSame = (comps1.year == comps2.year);
	
	return isSame;
}


@end
