//
//  ProtocolTools.m
//  ProtocolOneToMore
//
//  Created by 张奥 on 2019/11/7.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "ProtocolTools.h"

static dispatch_once_t onceToken;
static ProtocolTools *protocolTools;

@interface ProtocolTools()

@property (nonatomic, strong , readonly) NSHashTable    *delegate;

//防止多线程同事调用 加锁
@property (nonatomic,strong) NSLock    *delegateLock;

@end

@implementation ProtocolTools

+ (instancetype)sharedInstance {
    dispatch_once(&onceToken, ^{
        protocolTools = [[self alloc] init];
    });
    return protocolTools;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _delegate = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    return self;
}

-(NSLock *)delegateLock{
    if (!_delegateLock) {
        _delegateLock = [[NSLock alloc] init];
    }
    return _delegateLock;
}

-(void)addDelegate:(id<ProtocolToolsDelegate>)delegate{
    [self.delegateLock lock];
    [self.delegate addObject:delegate];
    [self.delegateLock unlock];
}

-(void)removeDelegate:(id<ProtocolToolsDelegate>)delegate{
    [self.delegateLock lock];
    [self.delegate removeObject:delegate];
    [self.delegateLock unlock];
}

-(void)removeAllDelegate{
    //销毁所有代理
    [self.delegateLock lock];
    [self.delegate removeAllObjects];
    [self.delegateLock unlock];
    //销毁单例
    protocolTools = nil;
    onceToken = 0;
}

-(void)sendMessageL:(id)message{
    [self.delegateLock lock];
    for (id delegate in self.delegate) {
        if ([delegate respondsToSelector:@selector(senMessageInfo:)]) {
            [delegate senMessageInfo:message];
        }
    }
    [self.delegateLock unlock];
}

@end
