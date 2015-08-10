//
//  RamblerModuleBetaPresenter.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import "RamblerModuleBetaViewOutput.h"
#import "RamblerModuleBetaInteractorOutput.h"
#import "RamblerModuleBetaConfigurator.h"

@protocol RamblerModuleBetaViewInput;
@protocol RamblerModuleBetaInteractorInput;
@protocol RamblerModuleBetaRouterInput;

/**
 
 */
// Intermodule Data Transfer Example. Конфигурация. Шаг 2. Презентер(или специальный класс для сложных модулей) должен реализовать протокол
// конфигуратора модуля
@interface RamblerModuleBetaPresenter : NSObject <RamblerModuleBetaViewOutput, RamblerModuleBetaInteractorOutput, RamblerModuleBetaConfigurator>

@property (nonatomic, weak) id<RamblerModuleBetaViewInput> view;
@property (nonatomic, strong) id<RamblerModuleBetaInteractorInput> interactor;
@property (nonatomic, strong) id<RamblerModuleBetaRouterInput> router;

@end

