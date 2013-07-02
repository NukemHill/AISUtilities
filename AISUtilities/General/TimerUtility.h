//
//  TimerUtility.h
//  Pandora
//
//  Created by Gregory Hill on 2/26/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Timer [TimerUtility sharedTimerUtility]

@protocol TimerListener;


@interface TimerUtility : NSObject

@property (nonatomic, strong) id<TimerListener>				listener;

@property (nonatomic, assign, getter = isDisabled) BOOL		disabled;

+ (TimerUtility *) sharedTimerUtility;

- (void) resetTime;


@end

@protocol TimerListener <NSObject>

- (void) appHasTimedOut;

@end