//
//  RamblerModuleAlphaViewInput.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <Foundation/Foundation.h>

typedef void (^AlphaModuleViewDataResulBlock)(NSString *data);

/**
 
 */
@protocol RamblerModuleAlphaViewInput <NSObject>

- (void)getDataWithResultBlock:(AlphaModuleViewDataResulBlock)resultBlock;

@end

