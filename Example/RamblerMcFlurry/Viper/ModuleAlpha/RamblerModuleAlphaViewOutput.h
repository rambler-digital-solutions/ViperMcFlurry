//
//  RamblerModuleAlphaViewOutput.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleAlphaViewOutput <NSObject>

- (void)setupView;
- (void)sendData:(NSString*)data;

@end

