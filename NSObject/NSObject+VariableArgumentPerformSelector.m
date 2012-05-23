//
//  NSObject+PerformSelectorVaried.m
//  Conductor
//
//  Created by Michael Robinson on 23/05/12.
//

#import "NSObject+VariableArgumentPerformSelector.h"
#import "objc/message.h"

#define MAX_MESSAGE_ARGUMENTS (10)

@implementation NSObject (VariableArgumentPerformSelector)

/**
 * Perform a selector with a variable number of arguments
 * @param aSelector The selector to perform
 * @param firstObject the first argument
 * @param ... Subsequent NSObject arguments
 */
- (void) performSelector:(SEL)aSelector withObjects:(NSObject *)firstObject, ... {

    // Prepare array of object pointers to be passed to objc_msgSend
    typedef NSObject *objectArray[MAX_MESSAGE_ARGUMENTS];
    objectArray messageArguments = {0};

    // Add the variadic NSObject arguments to the object pointer array
    size_t variadicArgumentIndex = 0;
    va_list variadicArguments;
    va_start(variadicArguments, firstObject);
    for (NSObject *variadicArgument = firstObject; variadicArgument != nil; variadicArgument = va_arg(variadicArguments, NSObject*)) {
        messageArguments[variadicArgumentIndex++] = variadicArgument;
    }
    va_end(variadicArguments);

    // Send the message
    objc_msgSend(self, aSelector,
                 messageArguments[0],
                 messageArguments[1],
                 messageArguments[2],
                 messageArguments[3],
                 messageArguments[4],
                 messageArguments[5],
                 messageArguments[6],
                 messageArguments[7],
                 messageArguments[8],
                 messageArguments[9]);

}

@end
