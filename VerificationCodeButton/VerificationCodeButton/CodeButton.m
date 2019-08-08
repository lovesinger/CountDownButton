//
//  CodeButton.m
//  VerificationCodeButton
//
//  Created by 许立强 on 2019/8/8.
//  Copyright © 2019 xlq. All rights reserved.
//

#import "CodeButton.h"

@interface CodeButton ()


@end

@implementation CodeButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置按钮默认样式
        [self setTitleColor:[UIColor colorWithRed:75/255.f green:123/255.f blue:255/255.f alpha:1] forState:UIControlStateNormal];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
        
        [self addTarget:self action:@selector(didClickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)didClickButton{
    if (self.clickButtonBlock) {
        self.clickButtonBlock(self);
    }
}

-(void)startTimerWithTotalTime:(NSUInteger)totalTime andTimeChangeBlock:(TimeChangeBlock)timeChangeBlock andTimeStopBlock:(TimeStopBlock)timeStopBlock{
    //总时间
    __block NSUInteger time = totalTime;
    //创建GCD计算器
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (time <= 0) {
            dispatch_source_cancel(timer);
            //在主线程设置计时器停止时按钮样式
            dispatch_async(dispatch_get_main_queue(), ^{
                if (timeStopBlock) {
                    timeStopBlock(self);
                }else{
                    [self setTitle:@"重新发送" forState:UIControlStateNormal];
                    [self setTitleColor:[UIColor colorWithRed:75/255.0f green:123/255.0f blue:255/255.0f alpha:1] forState:UIControlStateNormal];
                    [self setUserInteractionEnabled:YES];
                }
            });
            
        }else{
            //开始计时
            NSString* lastTime = [NSString stringWithFormat:@"%ld", time];
            //在主线程设置计时器倒计时的按钮样式
            dispatch_async(dispatch_get_main_queue(), ^{
            
                if (timeChangeBlock) {
                    timeChangeBlock(self, lastTime);
                }else{
                    [self setTitle:[NSString stringWithFormat:@"重新发送(%@)", lastTime] forState:UIControlStateNormal];
                    [self setTitleColor:[UIColor colorWithRed:190/255.f green:190/255.f blue:190/255.f alpha:1] forState:UIControlStateNormal];
                    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
                    [self setUserInteractionEnabled:NO];
                }
                
            });
            time--;
        }
        
    });
    //启动
    dispatch_resume(timer);
    
}



@end
