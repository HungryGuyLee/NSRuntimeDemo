//
//  NSArray+Swizzle.m
//  NSRuntimeDemo
//
//  Created by Rock on 14-5-20.
//  Copyright (c) 2014年 Rock. All rights reserved.
//

#import "NSArray+Swizzle.h"

@implementation NSArray (Swizzle)

- (id)myLastObject
{
    id ret = [self myLastObject];
    NSLog(@"************ myLastObject **************");
    return ret;
}

@end
