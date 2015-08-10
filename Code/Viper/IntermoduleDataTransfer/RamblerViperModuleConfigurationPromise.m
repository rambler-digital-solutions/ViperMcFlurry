//
//  RamblerViperModuleConfigurationPromise.m
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleConfigurationPromise.h"

@interface RamblerViperModuleConfigurationPromise ()

@property (nonatomic,strong) RCCModuleConfigurationBlock configuraionBlock;

@end

@implementation RamblerViperModuleConfigurationPromise

- (void)thenConfigureModuleWithBlock:(RCCModuleConfigurationBlock)configuraionBlock {
    self.configuraionBlock = configuraionBlock;
    [self tryToExecute];
}

- (void)setModuleConfigurator:(id<RamblerViperModuleConfiguratorProtocol>)moduleConfigurator {
    _moduleConfigurator = moduleConfigurator;
    [self tryToExecute];
}

-(void)tryToExecute {
    if (self.moduleConfigurator != nil && self.configuraionBlock != nil) {
        self.configuraionBlock(self.moduleConfigurator);
    }
}

@end
