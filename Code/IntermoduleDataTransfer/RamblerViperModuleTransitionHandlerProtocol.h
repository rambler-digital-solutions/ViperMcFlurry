//
//  RamblerViperModuleTransitionHandlerProtocol.h
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
@protocol RamblerViperModuleTransitionHandlerProtocol <NSObject>

@optional
/// Метод перехода между модулями через Segue. Метод создает Promise, упаковывает его и Sender в специальный объект
/// RamblerVipertModuleTransitionSegueData и отправляет данные в PerformSegue.
- (id<RamblerViperModuleConfigurationPromiseProtocol>)performPromiseSegue:(NSString*)segueIdentifier withSender:(id)sender;

/// В базовой реализации, в методе необходимо извлечь Promise из словаря и задать ему свойство moduleConfigurator для вызова Promise.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

/// Метод внедрения модуля через RamblerViperEmbedModuleSegue с заданием View-контейнера. Создает Promise, упаковывает его,
///  sender и containerView в cпециальный объект RamblerViperEmbedModuleTransitionSegueData
- (id<RamblerViperModuleConfigurationPromiseProtocol>)embedModuleWithSegue:(NSString*)segueIdentifier
                                                         intoContainerView:(UIView*)containerView
                                                                withSender:(id)sender;
/// Метод запроса View-контейнера по идентификатору. Позволяет скрыть механизм получения view у конкретного контроллера.
/// Теоретические может использоваться для добавления модулей в ячейки, но на практике пока не применялось.
- (UIView*)containerViewWithIdentifier:(NSString*)identifier;

/// Метод удаления внедренного модуля из родительского модуля. Используется для закрытия информмационных окон и т.п.
- (void)removeFromParentModule;

/// Метод для закрытия ViewController из родительского модуля. Модальный или в NavigationController
- (void)dismissModule;

@end
