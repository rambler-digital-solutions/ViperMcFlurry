//
//  UIViewController+RamblerViperModuleTransitionHandling.h
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 03/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleTransitionHandlerProtocol.h"

/**
 * Категория с базовыми реализациями методов ViewController для создания Promise и его вызова
 */
@interface UIViewController (RamblerViperModuleTransitionHandling)<RamblerViperModuleTransitionHandlerProtocol>

- (id<RamblerViperModuleConfigurationPromiseProtocol>)rds_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender;
- (id<RamblerViperModuleConfigurationPromiseProtocol>)rambler_embedModuleWithSegue:(NSString*)segueIdentifier
                                                         intoContainerView:(UIView*)containerView
                                                                withSender:(id)sender;
- (UIView*)rambler_containerViewWithIdentifier:(NSString*)identifier;
- (void)rambler_removeFromParentModule;

- (void)rds_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
