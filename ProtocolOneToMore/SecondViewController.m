//
//  SecondViewController.m
//  ProtocolOneToMore
//
//  Created by 张奥 on 2019/11/7.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "SecondViewController.h"
#import "ProtocolTools.h"
#import "ThirdViewController.h"
@interface SecondViewController ()<ProtocolToolsDelegate>{
    ProtocolTools *      _protocol;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _protocol =   [ProtocolTools sharedInstance];
    [_protocol addDelegate:self];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 80, 80);
    [button setTitle:@"界面2" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8.f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
-(void)clickButton{
    [self presentViewController:[ThirdViewController new] animated:YES completion:nil];
}
-(void)senMessageInfo:(id)messageInfo{
    if ([messageInfo isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)messageInfo;
        NSLog(@"界面2======%@",dic);
    }
}
-(void)dealloc{
    [_protocol removeDelegate:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
