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

@implementation UIViewController (DefaultViperModuleTransitionHandling)

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rds_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];
    [self performSegueWithIdentifier:segueIdentifier
                              sender:[RamblerViperModuleTransitionSegueData segueDataWithSender:sender
                                                                                     andPromise:promise]];
    return promise;
}

- (void)rds_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[RamblerViperModuleTransitionSegueData class]]) {
        RamblerViperModuleTransitionSegueData* segueData = sender;
        if ([segueData.promise isKindOfClass:[RamblerViperModuleConfigurationPromise class]]) {
            RamblerViperModuleConfigurationPromise* promise = segueData.promise;
            id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator = nil;
            if ([segue.destinationViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
                moduleConfigurator = [(id<RamblerViperModuleConfiguratorHolder>)segue.destinationViewController moduleConfigurator];
            }
            promise.moduleConfigurator = moduleConfigurator;
        }
    }
}

@end
