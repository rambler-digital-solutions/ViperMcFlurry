//
//  RamblerViperModuleConfiguratorProtocol.h
//  VIPER McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Базовый протокол конфигуратора модуля. Для простого модуля в роли конфигуратора может выступать Presenter.
 * Для сложного модуля, которому требуется Run-time настройка Viper и/или Interactor разумно создать дополнительный
 * объект-конфигуратор.
 */
@protocol RamblerViperModuleConfiguratorProtocol <NSObject>

@end
