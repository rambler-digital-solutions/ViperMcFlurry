//
//  RamblerViperPlaceholderViewController.m
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 25/09/15.
//
//

#import "RamblerViperPlaceholderViewController.h"
#import "RamblerViperModuleFabric.h"
#import <Typhoon/Typhoon.h>

@interface RamblerViperPlaceholderViewController ()

@end

@implementation RamblerViperPlaceholderViewController

- (id)destinationViewControllerForSegue {
    
    NSArray *parts = [self.restorationIdentifier componentsSeparatedByString:@"@"];
    if (parts.count != 2) {
        return nil;
    }
    
    NSString *storyboardName = parts.lastObject;
    NSString *viewControllerId = parts.firstObject;
    
    TyphoonStoryboard *storyboard = [TyphoonStoryboard storyboardWithName:storyboardName
                                                                  factory:self.factory
                                                                   bundle:nil];
    RamblerViperModuleFabric *destinationModuleFabric = [[RamblerViperModuleFabric alloc] initWithStoryboard:storyboard
                                                                                            andRestorationId:viewControllerId];
    
    id destinationViewController = [destinationModuleFabric instantiateModuleTransitionHandler];
    return destinationViewController;
}

@end
