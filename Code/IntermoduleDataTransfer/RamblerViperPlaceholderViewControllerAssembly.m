//
//  RamblerViperPlaceholderViewControllerAssembly.m
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 30/09/15.
//
//

#import "RamblerViperPlaceholderViewControllerAssembly.h"
#import "RamblerViperPlaceholderViewController.h"

@implementation RamblerViperPlaceholderViewControllerAssembly

- (RamblerViperPlaceholderViewController*)ramblerViperPlaceholderViewController {
    return [TyphoonDefinition withClass:[RamblerViperPlaceholderViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(factory)
                                                    with:self];
                          }];
}

@end
