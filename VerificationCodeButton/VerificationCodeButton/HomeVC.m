//
//  HomeVC.m
//  VerificationCodeButton
//
//  Created by 许立强 on 2019/8/8.
//  Copyright © 2019 xlq. All rights reserved.
//

#import "HomeVC.h"
#import "ViewController.h"

@interface HomeVC ()


@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}


- (IBAction)didClickButton:(UIButton *)sender {
    ViewController* vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
