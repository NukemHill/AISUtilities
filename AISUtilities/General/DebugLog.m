//
//  DebugLog.m
//  Pandora
//
//  Created by Gregory Hill on 2/6/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "DebugLog.h"

void _DebugLog(NSString *format,...) {
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"]) {
		format = [format stringByAppendingString: @"\n"];
    }
    NSString *body =  [[NSString alloc] initWithFormat: format arguments: ap];
    va_end (ap);
    fprintf(stderr,"%s",[body UTF8String]);
}


@implementation DebugLog

@end
