//
//  RamblerViperModuleConfigurationPromise.h
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleConfigurationPromiseProtocol.h"

/**
 Блок конфигурации модуля. Необходим для сохранения оцередности вызовов конфигурации и методов модуля. Позволяет
 избежать ситуации, в которой обращение ко view у viewcontroller модуля выполняется раньше, чем конфугурация модуля.
 Это приводит к некорректному поведению.
 */
typedef void (^RamblerViperModuleActivationBlock)();

@protocol RamblerViperModuleConfiguratorProtocol;

/**
 * Базовая реализация Promise для конфигурации модуля.
 *
 * Для срабатывания Promise ему необходимо задать moduleConfigurator и configurationBlock. Promise вызывается при
 * заполнении обоих свойств. Сам промис создается в PerformPromiseSegue:withSender: и передается в prepareForSegue.
 * В prepareForSegue у Promise задается свойство moduleConfigurator и вызывается Promise.
 */
@interface RamblerViperModuleConfigurationPromise : NSObject<RamblerViperModuleConfigurationPromiseProtocol>

/// Блок активации модуля, вызывается после конфигурации модуля
@property (nonatomic, strong) RamblerViperModuleActivationBlock moduleActivationBlock;

/// Конфигуратор модуля
@property(nonatomic, weak) id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@end
