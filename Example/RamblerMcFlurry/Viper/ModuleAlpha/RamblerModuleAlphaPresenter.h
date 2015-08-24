//
//  RamblerModuleAlphaPresenter.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaViewOutput.h"
#import "RamblerModuleAlphaInteractorOutput.h"

@protocol RamblerModuleAlphaViewInput;
@protocol RamblerModuleAlphaInteractorInput;
@protocol RamblerModuleAlphaRouterInput;

/**
 
 */
@interface RamblerModuleAlphaPresenter : NSObject <RamblerModuleAlphaViewOutput, RamblerModuleAlphaInteractorOutput>

@property (nonatomic, weak) id<RamblerModuleAlphaViewInput> view;
@property (nonatomic, strong) id<RamblerModuleAlphaInteractorInput> interactor;
@property (nonatomic, strong) id<RamblerModuleAlphaRouterInput> router;

@end

