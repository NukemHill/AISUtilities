//
//  NSDecimalNumber+Price.m
//  Pandora
//
//  Created by Gregory Hill on 10/15/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import "NSDecimalNumber+Price.h"

@implementation NSDecimalNumber (Price)

+ (CGFloat) getPriceFromString:(NSString *)priceString {
	CGFloat price = 0.0;

	NSNumberFormatter *currencyStyle = [[NSNumberFormatter alloc] init];

	[currencyStyle setNumberStyle:NSNumberFormatterCurrencyStyle];

	NSNumber *pAmount = [currencyStyle numberFromString:priceString]; // == 1256.34

	price = pAmount.floatValue;
	
	return price;
}

@end
