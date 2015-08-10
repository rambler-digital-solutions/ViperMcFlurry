//
//  UIViewController+DefaultViperModuleTransitionHandling.h
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 03/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleTransitionHandler.h"

/**
 * Категория с базовыми реализациями методов ViewController для создания Promise и его вызова
 */
@interface UIViewController (DefaultViperModuleTransitionHandling)<RamblerViperModuleTransitionHandler>

- (id<RamblerViperModuleConfigurationPromiseProtocol>)default_performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender;
- (void)default_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
