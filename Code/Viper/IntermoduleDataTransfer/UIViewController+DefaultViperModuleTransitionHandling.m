//
//  UIViewController+DefaultViperModuleTransitionHandling.m
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 03/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "UIViewController+DefaultViperModuleTransitionHandling.h"
#import "RamblerViperModuleConfigurationPromise.h"
#import "RamblerViperModuleConfiguratorHolder.h"

@implementation UIViewController (DefaultViperModuleTransitionHandling)

- (id<RamblerViperModuleConfigurationPromiseProtocol>)default_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender {
    RamblerViperModuleConfigurationPromise *promise = [[RamblerViperModuleConfigurationPromise alloc] init];
    [self performSegueWithIdentifier:segueIdentifier sender:@{
                                                              @"sender":sender,
                                                              @"promise":promise
                                                              }];
    return promise;
}

- (void)default_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[NSDictionary class]] && [segue.destinationViewController conformsToProtocol:@protocol(RamblerViperModuleConfiguratorHolder)]) {
        RamblerViperModuleConfigurationPromise * promise = sender[@"promise"];
        [promise setModuleConfigurator:[(id<RamblerViperModuleConfiguratorHolder>)segue.destinationViewController moduleConfigurator]];
    }
}

@end
