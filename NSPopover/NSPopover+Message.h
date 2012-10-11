//
//  NSPopover+Message.h
//  Requires NSString+Size, available at: https://github.com/faceleg/Cocoa-Categories
//
//  Created by Michael Robinson <mike@pagesofinterest.net> on 8/03/12.
//  License: http://pagesofinterest.net/license/
//

#import <Cocoa/Cocoa.h>

@interface NSPopover (Message)

+ (void) showRelativeToRect:(NSRect)rect
                     ofView:(NSView *)view
              preferredEdge:(NSRectEdge)edge
                     string:(NSString *)string
                   maxWidth:(float)width;

+ (void) showRelativeToRect:(NSRect)rect
                     ofView:(NSView *)view
              preferredEdge:(NSRectEdge)edge
                     string:(NSString *)string
            backgroundColor:(NSColor *)backgroundColor
                   maxWidth:(float)width;

+ (void) showRelativeToRect:(NSRect)rect
                     ofView:(NSView *)view
              preferredEdge:(NSRectEdge)edge
                     string:(NSString *)string
            backgroundColor:(NSColor *)backgroundColor
            foregroundColor:(NSColor *)foregroundColor
                       font:(NSFont *)font
                   maxWidth:(float)width;

+ (void) showRelativeToRect:(NSRect)rect
                     ofView:(NSView *)view
              preferredEdge:(NSRectEdge)edge
           attributedString:(NSAttributedString *)attributedString
            backgroundColor:(NSColor *)backgroundColor
                   maxWidth:(float)width;
@end
