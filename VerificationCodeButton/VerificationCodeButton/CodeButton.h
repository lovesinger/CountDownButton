//
//  CodeButton.h
//  VerificationCodeButton
//
//  Created by 许立强 on 2019/8/8.
//  Copyright © 2019 xlq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CodeButton;

typedef void(^TimeChangeBlock)(CodeButton* sender, NSString* lastTime);   //时间改变的block
typedef void(^TimeStopBlock)(CodeButton* sender);   //时间结束的block
typedef void(^ClickButtonBlock)(CodeButton* sender);   //点击按钮的block

@interface CodeButton : UIButton

//点击按钮时的回调
@property (nonatomic, copy) ClickButtonBlock clickButtonBlock;


/**
 开启计时器的方法

 @param totalTime 总时长
 @param timeChangeBlock 时间发生改变的回调，可设置按钮随时间改变的样式
 @param timeStopBlock 计时结束的回调，可设置计时结束时按钮的样式
 */
-(void)startTimerWithTotalTime:(NSUInteger)totalTime andTimeChangeBlock:(TimeChangeBlock)timeChangeBlock andTimeStopBlock:(TimeStopBlock)timeStopBlock;


@end

