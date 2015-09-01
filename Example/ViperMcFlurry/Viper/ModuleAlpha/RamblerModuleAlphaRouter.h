//
//  RamblerModuleAlphaRouter.h
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaRouterInput.h"
#import <ViperMcFlurry/Viper.h>

/**
 
 */
@interface RamblerModuleAlphaRouter : NSObject <RamblerModuleAlphaRouterInput>

@property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property (nonatomic,strong) id<RamblerViperModuleFabricProtocol> betaModuleFabric;

@end