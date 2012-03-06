//
//  NSString+ContainerSize.m
//  Conductor
//
//  Created by Michael Robinson on 6/03/12.
//  Copyright (c) 2012 Realmac Software. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (NSSize) sizeWithWidth:(float)width andFont:(NSFont *)font {
    
    NSSize size = NSMakeSize(width, FLT_MAX);
    
    NSTextStorage *textStorage = [[[NSTextStorage alloc] initWithString:self] autorelease];
    NSTextContainer *textContainer = [[[NSTextContainer alloc] initWithContainerSize:size] autorelease];
    NSLayoutManager *layoutManager = [[[NSLayoutManager alloc] init] autorelease];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    [textStorage addAttribute:NSFontAttributeName value:font
                        range:NSMakeRange(0, [textStorage length])];
    [textContainer setLineFragmentPadding:0.0];
    
    [layoutManager glyphRangeForTextContainer:textContainer];
    
    size.height = [layoutManager usedRectForTextContainer:textContainer].size.height;
    
    [layoutManager release];
    [textContainer release];
    [textStorage release];    
    
    return size;
}

@end
