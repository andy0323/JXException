# JXException
异常捕获系统、

## iOS客户端

**JXExceptionManager**

捕获客户端异常、对异常信息进行处理。

	[JXExceptionManager shareInstance];
	
捕获异常、自定义处理异常信息

	- (void)registExceptionHandle:(JXExceptionHandler)exceptionHandler;
	
## express服务端统计后台

