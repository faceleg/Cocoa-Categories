//
//  NSColor+Hex.m
//
//  Created by Michael Robinson on 4/12/11.
//  License: http://pagesofinterest.net/license/
//

#import "NSColor+Hex.h"

@implementation NSColor (Hex)


+ (NSColor *) colorWithHex:(NSString *)hexColor {
    
    // Remove the hash if it exists
    hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
    int length = (int)[hexColor length];
    bool triple = (length == 3);
    
    NSMutableArray *rgb = [[NSMutableArray alloc] init];
    
    // Make sure the string is three or six characters long
    if (triple || length == 6) {
        
        CFIndex i = 0;
        UniChar character = 0;
        NSString *segment = @"";
        CFStringInlineBuffer buffer;
        CFStringInitInlineBuffer((CFStringRef)hexColor, &buffer, CFRangeMake(0, length));
        
        
        while ((character = CFStringGetCharacterFromInlineBuffer(&buffer, i)) != 0 ) {
            if (triple) segment = [segment stringByAppendingFormat:@"%c%c", character, character];
            else segment = [segment stringByAppendingFormat:@"%c", character];
            
            if ((int)[segment length] == 2) {
                NSScanner *scanner = [[NSScanner alloc] initWithString:segment];
                
                unsigned number;
                
                while([scanner scanHexInt:&number]){
                    [rgb addObject:[NSNumber numberWithFloat:(float)(number / (float)255)]];
                }
                segment = @"";
            }
            
            i++;
        }
        
        // Pad the array out (for cases where we're given invalid input)
        while ([rgb count] != 3) [rgb addObject:[NSNumber numberWithFloat:0.0]];
        
        return [NSColor colorWithCalibratedRed:[[rgb objectAtIndex:0] floatValue] 
                                         green:[[rgb objectAtIndex:1] floatValue] 
                                          blue:[[rgb objectAtIndex:2] floatValue] 
                                         alpha:1];
    }
    else {
        NSException* invalidHexException = [NSException exceptionWithName:@"InvalidHexException"
                                                                   reason:@"Hex color not three or six characters excluding hash"                                    
                                                                 userInfo:nil];
        @throw invalidHexException;
        
    }
    
}

- (NSString *) hexColor {
    
    // Convert colour to RGBA
    NSColor *rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    
    return [NSString stringWithFormat:@"#%0.2X%0.2X%0.2X",
            (int)([rgb redComponent] * 255),
            (int)([rgb greenComponent] * 255),
            (int)([rgb blueComponent] * 255)];
}

@end
