//
//  RamblerModuleBetaModuleAssembly.h
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Typhoon/Typhoon.h>

@protocol RamblerViperModuleFabricProtocol;

@interface RamblerModuleBetaModuleAssembly : TyphoonAssembly

- (id<RamblerViperModuleFabricProtocol>)fabricBetaModule;

@end

