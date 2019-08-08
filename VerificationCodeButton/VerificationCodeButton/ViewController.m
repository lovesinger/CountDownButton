//
//  ViewController.m
//  VerificationCodeButton
//
//  Created by 许立强 on 2019/8/8.
//  Copyright © 2019 xlq. All rights reserved.
//

#import "ViewController.h"
#import "CodeButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发送验证码";
    
    //创建按钮，设置frame
    CodeButton* codeButton = [CodeButton buttonWithType:UIButtonTypeCustom];
    codeButton.frame = CGRectMake(0, 0, 100, 50);
    codeButton.center = self.view.center;
    [self.view addSubview:codeButton];
    
    //设置按钮样式，不设将使用默认样式
//    [codeButton setTitleColor:[UIColor colorWithRed:75/255.f green:123/255.f blue:255/255.f alpha:1] forState:UIControlStateNormal];
//    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//    codeButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    
    //点击按钮时的回调
    __weak typeof(codeButton) weakCodeButton = codeButton;
    codeButton.clickButtonBlock = ^(CodeButton *sender) {
        //点击按钮,先调用接口发送验证码
        //验证码发送成功之后，开始计时。可以分别在时间改变和倒计时结束时，设置按钮显示样式，不设将使用默认样式
        
        //下面为使用默认按钮样式写法
        [weakCodeButton startTimerWithTotalTime:59 andTimeChangeBlock:nil andTimeStopBlock:nil];
        
        //下面为自定义按钮样式的写法
//        [weakCodeButton startTimerWithTotalTime:59 andTimeChangeBlock:^(CodeButton *sender, NSString *lastTime) {
//            [sender setTitle:[NSString stringWithFormat:@"重新发送(%@)", lastTime] forState:UIControlStateNormal];
//            [sender setTitleColor:[UIColor colorWithRed:190/255.f green:190/255.f blue:190/255.f alpha:1] forState:UIControlStateNormal];
//            [sender setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
//            [sender setUserInteractionEnabled:NO];
//
//        } andTimeStopBlock:^(CodeButton *sender) {
//            [sender setTitle:@"重新发送" forState:UIControlStateNormal];
//            [sender setTitleColor:[UIColor colorWithRed:75/255.0f green:123/255.0f blue:255/255.0f alpha:1] forState:UIControlStateNormal];
//            [sender setUserInteractionEnabled:YES];
//
//        }];
        
    };
    
}

@end
