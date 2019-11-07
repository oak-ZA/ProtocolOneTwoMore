//
//  ViewController.m
//  ProtocolOneToMore
//
//  Created by 张奥 on 2019/11/7.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "ViewController.h"
#import "ProtocolTools.h"
#import "SecondViewController.h"
#import "TestView.h"
@interface ViewController ()<ProtocolToolsDelegate>{
    ProtocolTools *         _protocol;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _protocol =   [ProtocolTools sharedInstance];
    [_protocol addDelegate:self];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 80, 80);
    [button setTitle:@"界面1" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8.f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    [self.view addSubview:view];
}

-(void)clickButton{
    [self presentViewController:[SecondViewController new] animated:YES completion:nil];
}

-(void)senMessageInfo:(id)messageInfo{
    if ([messageInfo isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)messageInfo;
        NSLog(@"界面1======%@",dic);
    }
}

-(void)dealloc{
    [_protocol removeDelegate:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
