//
//  RamblerModuleAlphaRouter.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaRouterInput.h"
#import <RamblerMcFlurry/Viper.h>

/**
 
 */
@interface RamblerModuleAlphaRouter : NSObject <RamblerModuleAlphaRouterInput>

@property (nonatomic,strong) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end