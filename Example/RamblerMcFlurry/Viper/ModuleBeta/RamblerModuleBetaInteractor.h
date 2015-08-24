//
//  RamblerModuleBetaInteractor.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>
#import "RamblerModuleBetaInteractorInput.h"

@protocol RamblerModuleBetaInteractorOutput;

/**
 
 */
@interface RamblerModuleBetaInteractor : NSObject <RamblerModuleBetaInteractorInput>

@property (nonatomic, weak) id<RamblerModuleBetaInteractorOutput> output;

@end

