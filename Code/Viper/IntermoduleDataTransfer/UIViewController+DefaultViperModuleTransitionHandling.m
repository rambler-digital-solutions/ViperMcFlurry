//
//  UIViewController+DefaultViperModuleTransitionHandling.m
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 03/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "UIViewController+DefaultViperModuleTransitionHandling.h"
#import "RamblerViperModuleConfigurationPromise.h"
#import "RamblerViperModuleConfiguratorHolder.h"
#import "RamblerViperModuleTransitionSegueData.h"
#import "RamblerViperEmbedModuleTransitionSegueData.h"
#import "RamblerEmbedModuleSegue.h"

@implementation UIViewController (DefaultViperModuleTransitionHandling)

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rds_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];

    __weak typeof(self) wself = self;
    promise.moduleActivationBlock = ^{
        typeof(self) sself = wself;
        [sself performSegueWithIdentifier:segueIdentifier
                                  sender:[RamblerViperModuleTransitionSegueData segueDataWithSender:sender
                                                                                         andPromise:promise]];
    };
    return promise;
}

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rambler_embedModuleWithSegue:(NSString*)segueIdentifier
                                                         intoContainerView:(UIView*)containerView
                                                                withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];
    RamblerViperEmbedModuleTransitionSegueData *segueInfo =
            [[RamblerViperEmbedModuleTransitionSegueData alloc] initWithSender:sender
                                                                    andPromise:promise
                                                              andContainerView:containerView];
    __weak typeof(self) wself = self;
    promise.moduleActivationBlock = ^{
        typeof(self) sself = wself;
        [sself performSegueWithIdentifier:segueIdentifier
                                   sender:segueInfo];
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
        if ([sender isKindOfClass:[RamblerViperEmbedModuleTransitionSegueData class]] && [segue isKindOfClass:[RamblerEmbedModuleSegue class]]) {
            RamblerViperEmbedModuleTransitionSegueData *embedModuleSegueInfo = (RamblerViperEmbedModuleTransitionSegueData*)sender;
            RamblerEmbedModuleSegue* embedModuleSegue = (RamblerEmbedModuleSegue*)segue;
            embedModuleSegue.containerView = embedModuleSegueInfo.containerView;
        }

        RamblerViperModuleTransitionSegueData *segueInfo = (RamblerViperModuleTransitionSegueData*)sender;
        RamblerViperModuleConfigurationPromise * promise = segueInfo.promise;
        id<RamblerViperModuleConfiguratorProtocol> configurator = nil;
        if ([segue.destinationViewController conformsToProtocol:@protocol(RamblerViperModuleTransitionHandlerProtocol)]) {
            configurator = [(id<RamblerViperModuleTransitionHandlerProtocol>)segue.destinationViewController moduleConfigurator];
        }
        [promise setModuleConfigurator:configurator];
    }
}

@end
