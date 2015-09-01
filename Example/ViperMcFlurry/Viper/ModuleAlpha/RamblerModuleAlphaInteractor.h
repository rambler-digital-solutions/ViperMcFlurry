//
//  RamblerModuleAlphaInteractor.h
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaInteractorInput.h"

@protocol RamblerModuleAlphaInteractorOutput;

/**
 
 */
@interface RamblerModuleAlphaInteractor : NSObject <RamblerModuleAlphaInteractorInput>

@property (nonatomic, weak) id<RamblerModuleAlphaInteractorOutput> output;

@end

