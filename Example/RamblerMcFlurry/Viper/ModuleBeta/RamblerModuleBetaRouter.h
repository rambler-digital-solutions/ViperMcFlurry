//
//  RamblerModuleBetaRouter.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import <RamblerMcFlurry/Viper.h>
#import "RamblerModuleBetaRouterInput.h"

/**
 
 */
@interface RamblerModuleBetaRouter : NSObject <RamblerModuleBetaRouterInput>

@property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end