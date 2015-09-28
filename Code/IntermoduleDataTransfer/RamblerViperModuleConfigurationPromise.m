//
//  RamblerViperModuleConfigurationPromise.m
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleConfigurationPromise.h"

@interface RamblerViperModuleConfigurationPromise ()
@property (nonatomic,assign) BOOL configurationBlockWasSet;
@property (nonatomic,assign) BOOL moduleConfiguratorWasSet;
@property (nonatomic,strong) RablerViperModuleConfigurationBlock configurationBlock;

@end

@implementation RamblerViperModuleConfigurationPromise

- (void)thenConfigureModuleWithBlock:(RablerViperModuleConfigurationBlock)configuraionBlock {
    self.configurationBlock = configuraionBlock;
    [self tryToExecute];
}

- (void)setConfigurationBlock:(RablerViperModuleConfigurationBlock)configurationBlock {
    _configurationBlock = configurationBlock;
    self.configurationBlockWasSet = YES;
}

- (void)setModuleConfigurator:(id<RamblerViperModuleConfiguratorProtocol>)moduleConfigurator {
    _moduleConfigurator = moduleConfigurator;
    self.moduleConfiguratorWasSet = YES;
    [self tryToExecute];
}

-(void)tryToExecute {
    if (self.moduleConfiguratorWasSet && self.configurationBlockWasSet) {
        
        if (self.configurationBlock != nil) {
            self.configurationBlock(self.moduleConfigurator);
        }
        if (self.moduleActivationBlock) {
            self.moduleActivationBlock();
        }
        self.moduleActivationBlock = nil;
    }
}

@end
