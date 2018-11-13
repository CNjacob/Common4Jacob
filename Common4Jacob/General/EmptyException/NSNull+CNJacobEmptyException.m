//
//  NSNull+CNJacobEmptyException.m
//  Common4Jacob
//
//  Created by jacob on 2018/11/13.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import "NSNull+CNJacobEmptyException.h"

@implementation NSNull (CNJacobEmptyException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeMethod:@selector(methodSignatureForSelector:) newMethod:@selector(jacob_methodSignatureForSelector:)];
        [self exchangeMethod:@selector(forwardInvocation:) newMethod:@selector(jacob_forwardInvocation:)];
    });
}

- (NSMethodSignature *)jacob_methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sig = [self jacob_methodSignatureForSelector:aSelector];
    if (sig) {
        return sig;
    }
    return [NSMethodSignature signatureWithObjCTypes:@encode(void)];
}

- (void)jacob_forwardInvocation:(NSInvocation *)anInvocation {
    NSUInteger returnLength = [[anInvocation methodSignature] methodReturnLength];
    if (!returnLength) {
        // nothing to do
        return;
    }
    
    // set return value to all zero bits
    char buffer[returnLength];
    memset(buffer, 0, returnLength);
    
    [anInvocation setReturnValue:buffer];
}

@end
