//
//  RamblerViperModuleConfigurationPromiseProtocol.h
//  VIPER McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerViperModuleConfiguratorProtocol;

/// Блок конфигурации модуля. Вызывается в PrepareForSegue.
typedef void (^RablerViperModuleConfigurationBlock)(id<RamblerViperModuleConfiguratorProtocol> viperModuleConfigurator);

/**
 * Базовый протокол для Promise конфигурации модуля
 */
@protocol RamblerViperModuleConfigurationPromiseProtocol <NSObject>

/// Метод в который передается блок конфугурации модуля. Блок вызывается с конфигуратором модуля внутри PrepareForSegue.
- (void)thenConfigureModuleWithBlock:(RablerViperModuleConfigurationBlock)configuraionBlock;

@end
