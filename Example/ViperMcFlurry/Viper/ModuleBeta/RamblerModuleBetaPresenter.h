//
//  RamblerModuleBetaPresenter.h
//  Проект:   ViperMcFlurry
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
#import "RamblerModuleBetaInput.h"

@protocol RamblerModuleBetaViewInput;
@protocol RamblerModuleBetaInteractorInput;
@protocol RamblerModuleBetaRouterInput;

@interface RamblerModuleBetaPresenter : NSObject <RamblerModuleBetaViewOutput, RamblerModuleBetaInteractorOutput, RamblerModuleBetaInput>

@property (nonatomic, weak) id<RamblerModuleBetaViewInput> view;
@property (nonatomic, strong) id<RamblerModuleBetaInteractorInput> interactor;
@property (nonatomic, strong) id<RamblerModuleBetaRouterInput> router;

@end

