//
//  JXExceptionManager.m
//  ios_demo
//
//  Created by andy on 1/7/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import "JXExceptionManager.h"
#import "JXExceptionModel.h"
#import <objc/message.h>
static JXExceptionManager *_instance = nil;

@implementation JXExceptionManager

- (id)init
{
    if (self = [super init]) {
        NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    }
    return self;
}

#pragma mark - 
#pragma mark 共有函数

/**
 *  设置单例
 */
+ (JXExceptionManager *)shareInstance
{
    static JXExceptionManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

/**
 *  自定义设置异常处理行为
 *
 *  @param exceptionHandler 异常行为处理
 */
- (void)registExceptionHandle:(JXExceptionHandler)exceptionHandler
{
    _exceptionHandler = [exceptionHandler copy];
}

/**
 *  取消异常报错
 */
+ (void)cleanHelper {
    _instance = nil;
    NSSetUncaughtExceptionHandler(NULL);
}

#pragma mark -
#pragma mark 异常捕获

void UncaughtExceptionHandler(NSException *exception)
{
    JXExceptionModel *crashInfo = [[JXExceptionModel alloc] initWithException:exception];
    
    ((void(*)(id, SEL, id))objc_msgSend)([JXExceptionManager shareInstance], @selector(crashCallback:), crashInfo);
}

- (void)crashCallback:(JXExceptionModel *)exceptionModel
{
    if (_exceptionHandler) {
        _exceptionHandler(exceptionModel);
    }
}

@end
