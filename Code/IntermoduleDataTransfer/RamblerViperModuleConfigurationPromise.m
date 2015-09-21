//
//  RamblerViperModuleConfigurationPromise.m
//  VIPER McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleConfigurationPromise.h"

@interface RamblerViperModuleConfigurationPromise ()

@property (nonatomic,strong) RablerViperModuleConfigurationBlock configurationBlock;

@end

@implementation RamblerViperModuleConfigurationPromise

- (void)thenConfigureModuleWithBlock:(RablerViperModuleConfigurationBlock)configuraionBlock {
    self.configurationBlock = configuraionBlock;
    [self tryToExecute];
}

- (void)setModuleConfigurator:(id<RamblerViperModuleConfiguratorProtocol>)moduleConfigurator {
    _moduleConfigurator = moduleConfigurator;
    [self tryToExecute];
}

-(void)tryToExecute {
    if (self.moduleConfigurator != nil && self.configurationBlock != nil) {
        self.configurationBlock(self.moduleConfigurator);
        if (self.moduleActivationBlock) {
            self.moduleActivationBlock();
        }
        self.moduleActivationBlock = nil;
    }
}

@end
