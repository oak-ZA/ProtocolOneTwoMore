//
//  ProtocolTools.h
//  ProtocolOneToMore
//
//  Created by 张奥 on 2019/11/7.
//  Copyright © 2019 张奥. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocolToolsDelegate<NSObject>

-(void)senMessageInfo:(id)messageInfo;

@end

@interface ProtocolTools : NSObject

+ (instancetype)sharedInstance;

-(void)addDelegate:(id<ProtocolToolsDelegate>)delegate;

-(void)removeDelegate:(id<ProtocolToolsDelegate>)delegate;

-(void)removeAllDelegate;

-(void)sendMessageL:(id)message;

@end
