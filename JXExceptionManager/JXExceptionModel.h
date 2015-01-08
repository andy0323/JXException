//
//  JXExceptionModel.h
//  ios_demo
//
//  Created by andy on 1/8/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXExceptionModel : NSObject

/// 异常崩溃名称
@property (nonatomic, copy) NSString *crashName;

/// 异常崩溃原因
@property (nonatomic, copy) NSString *crashReason;

/// 异常崩溃时间搓
@property (nonatomic, copy) NSString *crashDate;

/// 异常栈象征
@property (nonatomic, strong) NSArray *crashCallStackSymbols;

- (id)initWithException:(NSException *)exception;

@end
