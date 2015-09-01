//
//  RamblerViperModuleFabricInstantiationPromiseProtocol.h
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerViperModuleConfigurationPromiseProtocol.h"
#import "RamblerViperModuleConfigurationPromise.h"

/**
 Протокол промиса добавления модуля в приложение. 
 В текущей реализации поддерживает два варианта: добавить модуль через PUSH для вызывающего модуля и добавить модуль в View-контейнер
 Каждый из методов возвращает промис конфигурации добавляемого модуля
 */
@protocol RamblerViperModuleFabricInstantiationPromiseProtocol <NSObject>

/**
 Добавление модуля через вызов push в navigation controller вызывающего модуля
 
 @return промис конфигурации добавляемого модуля
 */
- (id<RamblerViperModuleConfigurationPromiseProtocol>)andShow;
/**
 Добавление модуля во View-контейнер вызываюшего модуля
 
 @return промис конфигурации добавляемого модуля
 */
- (id<RamblerViperModuleConfigurationPromiseProtocol>)andEmbedIntoContainerView:(UIView*)containerView;

/**
 Добавление модуля через блок активации. В этом блоке можно реализовать вызов Segue или иную логику активации модуля.

 @return промис конфигурации добавляемого модуля
 */
- (id<RamblerViperModuleConfigurationPromiseProtocol>)andActivateUsingBlock:(RamblerViperModuleActivationBlock)activationBlock;

@end
