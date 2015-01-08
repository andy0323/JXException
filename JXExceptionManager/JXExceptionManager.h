//
//  JXExceptionManager.h
//  ios_demo
//
//  Created by andy on 1/7/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXExceptionModel;

/// 异常行为处理
typedef void (^JXExceptionHandler)(JXExceptionModel *exceptionModel);

/// 程序异常处理类
@interface JXExceptionManager : NSObject
{
    JXExceptionHandler _exceptionHandler;
}

/**
 *  设置单例
 */
+ (JXExceptionManager *)shareInstance;

/**
 *  设置异常处理行为
 *
 *  @param exceptionHandler 异常行为处理
 */
- (void)registExceptionHandle:(JXExceptionHandler)exceptionHandler;

/**
 *  取消异常报错
 */
+ (void)cleanHelper;


@end
