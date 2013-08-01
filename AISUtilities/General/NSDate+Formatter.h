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

- (NSString *) dateToStringWithFormat:(NSString *)dateFormat;

+ (NSDate *) stringToDate:(NSString *)dateString;

+ (NSDate *) stringToDate:(NSString *)dateString withFormat:(NSString *)dateFormat;

+ (NSArray *) availableDatesArray:(NSArray *)dateStrings;

- (BOOL) isSameDay:(NSDate *)date1;

- (NSDate *) dateByIncrementingDay:(NSInteger)dayCount month:(NSInteger)monthCount year:(NSInteger)yearCount;

- (BOOL) isSameDayAsDate:(NSDate *)date;

- (BOOL) isSameMonthAsDate:(NSDate *)date;

- (BOOL) isSameYearAsDate:(NSDate *)date;

@end
