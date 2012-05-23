//
//  NSColor+Hex.h
//
//  Created by Michael Robinson on 4/12/11.
//  License: http://pagesofinterest.net/license/
//

#import <AppKit/AppKit.h>

@interface NSColor (Hex)

+ (NSColor *) colorWithHex:(NSString *)hexColor;

- (NSString *) hexColor;

@end
