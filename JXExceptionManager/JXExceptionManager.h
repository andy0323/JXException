//
//  JXExceptionManager.h
//  ios_demo
//
//  Created by andy on 1/7/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXExceptionManager : NSObject

/// 设置单例
+ (JXExceptionManager *)shareInstance;

/// 取消异常报错
+ (void)cleanHelper;


@end
