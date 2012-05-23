//
//  NSPopover+Instance.m
//  Requires NSString+Size, available at: https://github.com/faceleg/Cocoa-Categories
//
//  Created by Michael Robinson <mike@pagesofinterest.net> on 8/03/12.
//  License: http://pagesofinterest.net/license/
//

#import "NSPopover+Message.h"
#import "NSString+Size.h"

@implementation NSPopover (Message)

+ (void) showRelativeToRect:(NSRect)rect
                     ofView:(NSView *)view
              preferredEdge:(NSRectEdge)edge
                 string:(NSString *)string
                   maxWidth:(float)width {


    float padding = 15;

    NSSize size = [string sizeWithWidth:width
                                andFont:[NSFont systemFontOfSize:[NSFont systemFontSizeForControlSize:NSRegularControlSize]]];

    NSSize popoverSize = NSMakeSize(size.width + (padding * 2), size.height + (padding * 2));
    NSRect popoverRect = NSMakeRect(0, 0, popoverSize.width, popoverSize.height);

    NSTextField *label = [[[NSTextField alloc] initWithFrame:NSMakeRect(padding, padding, size.width, size.height)] retain];

    [label setBezeled:NO];
    [label setDrawsBackground:NO];
    [label setEditable:NO];
    [label setSelectable:NO];
    [label setStringValue:string];
    [[label cell] setLineBreakMode:NSLineBreakByWordWrapping];

    NSView *container = [[[NSView alloc] initWithFrame:popoverRect] retain];
    [container addSubview:label];
    [label setBounds:NSMakeRect(padding, padding, size.width, size.height)];
    [container awakeFromNib];

    NSViewController *controller = [[[NSViewController alloc] init] retain];
    [controller setView:container];

    NSPopover *popover = [[[NSPopover alloc] init] retain];

    [popover setContentSize:popoverSize];
    [popover setContentViewController:controller];
    [popover setAnimates:YES];
    [popover setBehavior:NSPopoverBehaviorTransient];

    [popover showRelativeToRect:rect
                         ofView:view
                  preferredEdge:edge];
    [popover release];
    [controller release];
    [container release];
    [label release];
    return;
}

@end
