//
//  NSObject+PerformSelectorVaried.h
//  Conductor
//
//  Created by Michael Robinson on 23/05/12.
//  License: http://pagesofinterest.net/license/oftware.
//

#import <Foundation/Foundation.h>

@interface NSObject (VariableArgumentPerformSelector)

- (void) performSelector:(SEL)aSelector withObjects:(NSObject *)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

@end
