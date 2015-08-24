//
//  RamblerViperModuleTransitionHandler.h
//  Rambler McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 27/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RamblerViperModuleConfigurationPromiseProtocol;

/**
 * Протокол перехода между модулями.
 * Если переход между модулями выполняется через Segue а View - это ViewController, то он его и реализует.
 * Для модулей с другой архитектурой может потребоваться дополнительный объект.
 */
@protocol RamblerViperModuleTransitionHandler <NSObject>

@optional
/// Метод создает Promise, упаковывает его и Sender в словарь и отправляет данные в PerformSegue.
- (id<RamblerViperModuleConfigurationPromiseProtocol>)performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender;
/// В базовой реализации, в методе необходимо извлечь Promise из словаря и задать ему свойство moduleConfigurator для вызова Promise.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@end
