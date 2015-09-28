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

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rambler_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];

    RamblerViperModuleTransitionSegueData* segueData = [RamblerViperModuleTransitionSegueData segueDataWithSender:sender
                                                                                                       andPromise:promise];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:segueIdentifier
                                   sender:segueData];
    });
    
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
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:segueIdentifier
                                  sender:segueData];
    });

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
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
}

- (void)rambler_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[RamblerViperModuleTransitionSegueData class]]) {
        if ([sender isKindOfClass:[RamblerViperEmbedModuleTransitionSegueData class]] && [segue isKindOfClass:[RamblerViperEmbedModuleSegue class]]) {
            RamblerViperEmbedModuleTransitionSegueData *embedModuleSegueInfo = (RamblerViperEmbedModuleTransitionSegueData*)sender;
            RamblerViperEmbedModuleSegue * embedModuleSegue = (RamblerViperEmbedModuleSegue *)segue;
            embedModuleSegue.containerView = embedModuleSegueInfo.containerView;
        }

        RamblerViperModuleTransitionSegueData *segueInfo = (RamblerViperModuleTransitionSegueData*)sender;
        RamblerViperModuleConfigurationPromise * promise = segueInfo.promise;
        id<RamblerViperModuleConfiguratorProtocol> configurator = nil;
        
        UIViewController* targetViewController = segue.destinationViewController;
        if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
            targetViewController = [(UINavigationController*)segue.destinationViewController topViewController];
        }
        
        if ([targetViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
            configurator = [(id<RamblerViperModuleConfiguratorHolder>)targetViewController moduleConfigurator];
        }
        [promise setModuleConfigurator:configurator];
    }
}

- (void)rambler_dismissModule {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
