//
//  RamblerViperModuleTransitionSegueData.h
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 24/08/15.
//
//

#import <Foundation/Foundation.h>
#import "RamblerViperModuleConfigurationPromiseProtocol.h"

@interface RamblerViperModuleTransitionSegueData : NSObject

@property (nonatomic,strong,readonly) id sender;
@property (nonatomic,strong,readonly) id<RamblerViperModuleConfigurationPromiseProtocol> promise;

+ (instancetype)segueDataWithSender:(id)sender andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise;
- (instancetype)initWithSender:(id)sender andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise;

@end
