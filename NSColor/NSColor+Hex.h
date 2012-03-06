//
//  NSColor+Hex.h
//
//  Created by Michael Robinson on 4/12/11.
//  Copyright 2011 Code of Interest. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSColor (Hex)

+ (NSColor *) colorWithHex:(NSString *)hexColor;

- (NSString *) hexColor;

@end
