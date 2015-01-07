//
//  JXExceptionManager.m
//  ios_demo
//
//  Created by andy on 1/7/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import "JXExceptionManager.h"
static JXExceptionManager *_instance = nil;
@implementation JXExceptionManager
/// 单例
+ (JXExceptionManager *)shareInstance
{
    static JXExceptionManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)init
{
    if (self = [super init]) {
        NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    }
    return self;
}

/// 取消异常报错
+ (void)cleanHelper {
    _instance = nil;
    NSSetUncaughtExceptionHandler(NULL);
}

void UncaughtExceptionHandler(NSException *exception) {
    // 相关信息
    NSArray *arr = [exception callStackSymbols];
    // 异常原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    // 时间
    NSString *date = [[NSDate date] description];
    
    NSString *logMsg = [NSString stringWithFormat:
                        @"======== 异常崩溃详情 ========= \n"
                        "time:%@ ============================\n"
                        "name:%@\n"
                        "reason:\n"
                        "%@\n"
                        "callStackSymbols:\n"
                        "%@",
                        date,
                        name,
                        reason,
                        [arr componentsJoinedByString:@"\n"]];
    
    // 异常信息
    logMsg = [logMsg stringByAppendingString:@"\n"];
    
    // 打印异常信息
    NSLog(@"\n%@", logMsg);
}

@end
