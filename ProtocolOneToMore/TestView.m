//
//  TestView.m
//  ProtocolOneToMore
//
//  Created by 张奥 on 2019/11/7.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "TestView.h"
#import "ProtocolTools.h"
@interface TestView()<ProtocolToolsDelegate>{
    ProtocolTools *   _protol;
}

@end
@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        _protol = [ProtocolTools sharedInstance];
        [_protol addDelegate:self];
    }
    return self;
}


-(void)senMessageInfo:(id)messageInfo{
    if ([messageInfo isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)messageInfo;
        NSLog(@"view视图======%@",dic);
    }
}
@end
