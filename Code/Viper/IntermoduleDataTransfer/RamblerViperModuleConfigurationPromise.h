//
//  RamblerViperModuleConfigurationPromise.h
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleConfigurationPromiseProtocol.h"

@protocol RamblerViperModuleConfiguratorProtocol;

/**
 * Базовая реализация Promise для конфигурации модуля.
 *
 * Для срабатывания Promise ему необходимо задать moduleConfigurator и configurationBlock. Promise вызывается при
 * заполнении обоих свойств. Сам промис создается в PerformPromiseSegue:withSender: и передается в prepareForSegue.
 * В prepareForSegue у Promise задается свойство moduleConfigurator и вызывается Promise.
 */
@interface RamblerViperModuleConfigurationPromise : NSObject<RamblerViperModuleConfigurationPromiseProtocol>

/// Конфигуратор модуля
@property(nonatomic,weak) id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@end
