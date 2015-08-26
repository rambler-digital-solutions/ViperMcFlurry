//
//  RamblerViperModuleFabricInstantiationPromise.m
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleFabricInstantiationPromise.h"
#import "RamblerEmbedModuleSegue.h"
#import "RamblerViperModuleConfigurationPromise.h"
#import "RamblerViperModuleConfiguratorHolder.h"

@interface RamblerViperModuleFabricInstantiationPromise ()

@property (nonatomic,strong) id sourceViewController;
@property (nonatomic,strong) id destinationViewController;

@end

@implementation RamblerViperModuleFabricInstantiationPromise

- (instancetype)initWithSourceViewController:(id)sourceViewController andDestinationViewController:(id)destinationViewController {
    self = [super init];
    if (self) {
        self.sourceViewController = sourceViewController;
        self.destinationViewController = destinationViewController;
    }
    return self;
}

#pragma mark - RDSModuleFabricInstantiationPromiseProtocol

- (id<RamblerViperModuleConfigurationPromiseProtocol>)andShow {

    __weak typeof(self) wself = self;
    return [self andActivateUsingBlock:^{
        typeof (self) sself = wself;
        UINavigationController* sourceNavigationController = [sself.sourceViewController navigationController];
        [sourceNavigationController pushViewController:sself.destinationViewController
                                              animated:YES];
    }];
}
- (id<RamblerViperModuleConfigurationPromiseProtocol>)andEmbedIntoContainerView:(UIView*)containerView {

    __weak typeof(self) wself = self;
    return [self andActivateUsingBlock:^{
        typeof(self) sself = wself;
        RamblerEmbedModuleSegue *segue = [[RamblerEmbedModuleSegue alloc] initWithIdentifier:nil
                                                                                      source:sself.sourceViewController
                                                                                 destination:sself.destinationViewController];
        segue.containerView = containerView;
        [segue perform];
    }];
}

- (id<RamblerViperModuleConfigurationPromiseProtocol>)andActivateUsingBlock:(RamblerViperModuleActivationBlock)activationBlock {

    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];
    id<RamblerViperModuleConfiguratorProtocol> configurator = nil;
    if ([self.destinationViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
        configurator = [(id<RamblerViperModuleConfiguratorHolder>)self.destinationViewController moduleConfigurator];
    }
    [promise setModuleConfigurator:configurator];
    promise.moduleActivationBlock = activationBlock;
    return promise;
}


@end
