//
//  NSString+ContainerSize.h
//  Conductor
//
//  Created by Michael Robinson on 6/03/12.
//  Copyright (c) 2012 Realmac Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (NSSize) sizeWithWidth:(float)width andFont:(NSFont *)font;

@end
