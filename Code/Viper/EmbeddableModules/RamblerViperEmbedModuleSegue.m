//
//  RamblerViperEmbedModuleSegue.m
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperEmbedModuleSegue.h"

@implementation RamblerViperEmbedModuleSegue


- (void)perform {
    
    UIViewController *parentViewController = self.sourceViewController;
    UIViewController *embeddableModuleViewController = self.destinationViewController;
    
    [parentViewController addChildViewController:embeddableModuleViewController];
    [self.containerView addSubview: embeddableModuleViewController.view];
    
    UIView *moduleView = embeddableModuleViewController.view;
    // align moduleView from the left and right
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[moduleView]-0-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:NSDictionaryOfVariableBindings(moduleView)]];
    
    // align moduleView from the top and bottom
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[moduleView]-0-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:NSDictionaryOfVariableBindings(moduleView)]];
}

@end
