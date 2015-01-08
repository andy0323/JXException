//
//  JXExceptionModel.m
//  ios_demo
//
//  Created by andy on 1/8/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import "JXExceptionModel.h"

@implementation JXExceptionModel

- (id)initWithException:(NSException *)exception
{
    if (self = [super init]) {
        
        _crashName   = [exception name];
        _crashReason = [exception reason];
        _crashCallStackSymbols = [exception callStackSymbols];
        
        _crashDate = [NSString stringWithFormat:@"%ld", (long)([[NSDate date] timeIntervalSince1970])];
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:
            @"======== 异常崩溃详情 ========= \n"
            "time:%@ ============================\n"
            "name:%@\n"
            "reason:\n"
            "%@\n"
            "callStackSymbols:\n"
            "%@",
            _crashDate,
            _crashName,
            _crashReason,
            [_crashCallStackSymbols componentsJoinedByString:@"\n"]];
}

@end
