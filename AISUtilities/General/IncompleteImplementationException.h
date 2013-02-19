//
//  IncompleteImplementationException.h
//  Pandora
//
//  Created by Gregory Hill on 12/21/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncompleteImplementationException : NSException

+ (NSException *) exceptionWithClass:(Class)class method:(NSString *)method;


@end
