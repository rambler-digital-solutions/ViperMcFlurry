//
//  RamblerViperModuleFabricInstantiationPromise.m
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleFabricInstantiationPromise.h"
#import "RamblerViperEmbedModuleSegue.h"
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

/**
 Добавление модуля как модального ViewController в navigation controller вызывающего модуля
 
 @return промис конфигурации добавляемого модуля
 */
- (id<RamblerViperModuleConfigurationPromiseProtocol>)andShowModallyWithNavigationController:(UINavigationController*)navigationController {
    
    __weak typeof(self) wself = self;
    return [self andActivateUsingBlock:^{
        
        typeof (self) sself = wself;

        [navigationController setViewControllers:@[self.destinationViewController] animated:NO];
        
        [sself.sourceViewController presentViewController:navigationController
                                                 animated:YES
                                               completion:^{}];
    }];
}

- (id<RamblerViperModuleConfigurationPromiseProtocol>)andEmbedIntoContainerView:(UIView*)containerView {

    __weak typeof(self) wself = self;
    return [self andActivateUsingBlock:^{
        typeof(self) sself = wself;
        RamblerViperEmbedModuleSegue *segue = [[RamblerViperEmbedModuleSegue alloc] initWithIdentifier:nil
                                                                                      source:sself.sourceViewController
                                                                                 destination:sself.destinationViewController];
        segue.containerView = containerView;
        [segue perform];
    }];
}

- (id<RamblerViperModuleConfigurationPromiseProtocol>)andActivateUsingBlock:(RamblerViperModuleActivationBlock)activationBlock {

    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];
    id<RamblerViperModuleConfiguratorProtocol> configurator = nil;
    
    if ([self.destinationViewController isKindOfClass:[UINavigationController class]]) {
        
        UIViewController *topViewController = [self.destinationViewController topViewController];
        if ([topViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
            configurator = [(id<RamblerViperModuleConfiguratorHolder>)topViewController moduleConfigurator];
        }
    } else if ([self.destinationViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
        configurator = [(id<RamblerViperModuleConfiguratorHolder>)self.destinationViewController moduleConfigurator];
    }
    [promise setModuleConfigurator:configurator];
    promise.moduleActivationBlock = activationBlock;
    return promise;
}


@end
