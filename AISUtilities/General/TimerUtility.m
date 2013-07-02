//
//  TimerUtility.m
//  Pandora
//
//  Created by Gregory Hill on 2/26/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "TimerUtility.h"

@interface TimerUtility()

@property (nonatomic, strong) NSTimer						*countdownTimer;
@property (nonatomic, assign) NSTimeInterval				interval;

@end

@implementation TimerUtility

SYNTHESIZE_SINGLETON_FOR_CLASS(TimerUtility)

- (id) init {
	self = [super init];

	if(self) {
		self.interval = kTimeoutInMinutes * 60.0f;
	}

	return self;
}

- (void) resetTime {
	self.disabled = NO;
	
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: self.interval
													  target: self
													selector: @selector(timeout)
													userInfo: nil
													 repeats: NO];

	self.countdownTimer = timer;
}

- (void) timeout {
	if(!self.isDisabled) {
		[self.listener appHasTimedOut];

		self.disabled = YES;
	}
}

@end
