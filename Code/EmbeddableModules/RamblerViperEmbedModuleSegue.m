//
//  RamblerViperEmbedModuleSegue.m
//  VIPER McFlurry
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
    UIView *moduleView = embeddableModuleViewController.view;
    [self.containerView addSubview:moduleView];
    
    moduleView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[moduleView]-0-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:NSDictionaryOfVariableBindings(moduleView)]];

    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[moduleView]-0-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:NSDictionaryOfVariableBindings(moduleView)]];
}

@end
