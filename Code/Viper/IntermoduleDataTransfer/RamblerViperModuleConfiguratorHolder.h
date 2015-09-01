//
//  RamblerViperModuleConfiguratorHolder.h
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 30/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerViperModuleConfiguratorProtocol;

/**
 * Протокол хранителя конфигуратора модуля. Для работы через Segue данный протокол должен быть реализован
 * у ViewController. При инициализации модуля через Storyboard или иным способом этим конфигуратором может быть другой
 * Объект
 */
@protocol RamblerViperModuleConfiguratorHolder <NSObject>

/**
 Конфигуратор модуля с которым будет вызываеться блок конфигурации при добавлении модуля
 */
- (id<RamblerViperModuleConfiguratorProtocol>)moduleConfigurator;

@end
