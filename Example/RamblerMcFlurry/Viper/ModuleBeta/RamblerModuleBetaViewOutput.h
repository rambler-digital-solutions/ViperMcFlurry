//
//  RamblerModuleBetaViewOutput.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleBetaViewOutput <NSObject>

- (void)setupView;
- (void)didClickRemoveModuleButton;

@end

