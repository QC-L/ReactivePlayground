//
//  RectiveManager.m
//  ReactivePlayground
//
//  Created by QC.L on 16/1/9.
//  Copyright © 2016年 QC.L. All rights reserved.
//

#import "RectiveManager.h"
const CGFloat delayInSeconds = 1.0f;
@implementation RectiveManager
+ (void)signInWithUsername:(NSString *)username
                  password:(NSString *)password
                  complete:(SignInResponse)completeBlock
{
    // 作一个延时操作, 模仿网络验证
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 判断账号密码是否有误
        BOOL success = [username isEqualToString:@"username"] && [password isEqualToString:@"password"];
        // 调用block
        completeBlock(success);
    });
}
@end
