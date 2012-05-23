//
//  NSObject+PerformSelectorVaried.m
//  Conductor
//
//  License: http://pagesofinterest.net/license/
//

#import "NSObject+VariableArgumentPerformSelector.h"

@implementation NSObject (VariableArgumentPerformSelector)

/**
 * Perform a selector with a variable number of arguments
 * @param aSelector The selector to perform
 * @param firstObject the first argument
 * @param ... Subsequent NSObjecarguments
 */
- (void) performSelector:(SEL)aSelector withObjects:(NSObject *)firstObject, ... {

    NSInvocation *invocation = [[NSInvocation alloc] init];
    [invocation setSelector:aSelector];
    [invocation setTarget:self];

    NSUInteger argumentIndex = 1;

    va_list args;
    va_start(args, firstObject);
    for (NSObject *arg = firstObject; arg != nil; arg = va_arg(args, NSObject*)) {
        [invocation setArgument:&arg atIndex:argumentIndex];
        argumentIndex++;
    }
    va_end(args);

    [invocation invoke];

}

@end
