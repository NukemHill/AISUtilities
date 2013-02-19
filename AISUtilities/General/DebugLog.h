//
//  DebugLog.h
//  Pandora
//
//  Created by Gregory Hill on 2/6/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define DebugLog(args...) _DebugLog(args);
#else
#define DebugLog(x...)
#endif

void _DebugLog(NSString *format,...);

@interface DebugLog : NSObject

@end
