//
//  RamblerViperModuleFabricProtocol.h
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerViperModuleFabricInstantiationPromiseProtocol.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

/**
 Протокол фабрики модулей VIPER, инициализирует модуль, в методе инициализации возвращает промис, который позволяет добавить модуль через 
 push у navigationController или через внедрение модуля с заданный View-контейнер.
 */
@protocol RamblerViperModuleFabricProtocol <NSObject>

/**
 Создает промис, позволяющий добавить модуль в приложение
 
 @param transitionHandler обработчик переходов между модулями, чаще всего это ViewController вызывающего модуля
 
 @return промис
 */
- (id<RamblerViperModuleFabricInstantiationPromiseProtocol>)instantiateModuleFromTransitionHandler:(id<RamblerViperModuleTransitionHandlerProtocol>)transitionHandler;

@end
