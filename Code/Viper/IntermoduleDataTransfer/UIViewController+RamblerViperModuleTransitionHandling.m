//
//  UIViewController+RamblerViperModuleTransitionHandling.m
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 03/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "UIViewController+RamblerViperModuleTransitionHandling.h"
#import "RamblerViperModuleConfigurationPromise.h"
#import "RamblerViperModuleConfiguratorHolder.h"
#import "RamblerViperModuleTransitionSegueData.h"
#import "RamblerViperEmbedModuleTransitionSegueData.h"
#import "RamblerViperEmbedModuleSegue.h"

@implementation UIViewController (RamblerViperModuleTransitionHandling)

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rds_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];

    RamblerViperModuleTransitionSegueData* segueData = [RamblerViperModuleTransitionSegueData segueDataWithSender:sender
                                                                                                       andPromise:promise];
    __weak typeof(self) wself = self;
    
    /// Здесь не возникает RetainCycle с promise->segueData->promise, т.к. moduleActivationBlock присваивается nil после вызова.
    promise.moduleActivationBlock = ^{
        typeof(self) sself = wself;
        [sself performSegueWithIdentifier:segueIdentifier
                                   sender:segueData];
    };
    return promise;
}

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rambler_embedModuleWithSegue:(NSString*)segueIdentifier
                                                         intoContainerView:(UIView*)containerView
                                                                withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];
    RamblerViperEmbedModuleTransitionSegueData *segueData =
            [[RamblerViperEmbedModuleTransitionSegueData alloc] initWithSender:sender
                                                                    andPromise:promise
                                                              andContainerView:containerView];
    __weak typeof(self) wself = self;
    
    /// Здесь не возникает RetainCycle с promise->segueData->promise, т.к. moduleActivationBlock присваивается nil после вызова.
    promise.moduleActivationBlock = ^{
        typeof(self) sself = wself;
        [sself performSegueWithIdentifier:segueIdentifier
                                   sender:segueData];
    };

    return promise;
}

- (UIView*)rambler_containerViewWithIdentifier:(NSString*)identifier {
    id view = [self valueForKey:identifier];
    if ([view isKindOfClass:[UIView class]]) {
        return view;
    }
    else {
        return nil;
    }
}

- (void)rambler_removeFromParentModule {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)rds_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[RamblerViperModuleTransitionSegueData class]]) {
        if ([sender isKindOfClass:[RamblerViperEmbedModuleTransitionSegueData class]] && [segue isKindOfClass:[RamblerViperEmbedModuleSegue class]]) {
            RamblerViperEmbedModuleTransitionSegueData *embedModuleSegueInfo = (RamblerViperEmbedModuleTransitionSegueData*)sender;
            RamblerViperEmbedModuleSegue * embedModuleSegue = (RamblerViperEmbedModuleSegue *)segue;
            embedModuleSegue.containerView = embedModuleSegueInfo.containerView;
        }

        RamblerViperModuleTransitionSegueData *segueInfo = (RamblerViperModuleTransitionSegueData*)sender;
        RamblerViperModuleConfigurationPromise * promise = segueInfo.promise;
        id<RamblerViperModuleConfiguratorProtocol> configurator = nil;
        if ([segue.destinationViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
            configurator = [(id<RamblerViperModuleConfiguratorHolder>)segue.destinationViewController moduleConfigurator];
        }
        [promise setModuleConfigurator:configurator];
    }
}

@end
