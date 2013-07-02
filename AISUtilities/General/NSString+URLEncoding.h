//
//  NSString+Encoding.h
//  Pandora
//
//  Created by Gregory Hill on 10/5/12.
//  Copyright (c) 2012 Gregory Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)

- (NSString *) urlEncodeUsingEncoding:(NSStringEncoding)encoding;

@end
