//
//  NSObject+IncompleteException.h
//  Pandora
//
//  Created by Gregory Hill on 12/21/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (IncompleteException)

- (NSException *) incompleteExceptionWithMethod:(NSString *)methodName;


@end
