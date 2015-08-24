//
//  RamblerModuleAlphaPresenter.m
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleAlphaPresenter.h"
#import "RamblerModuleAlphaViewInput.h"
#import "RamblerModuleAlphaInteractorInput.h"
#import "RamblerModuleAlphaRouterInput.h"

@interface RamblerModuleAlphaPresenter()

@end

@implementation RamblerModuleAlphaPresenter

#pragma mark - RamblerModuleAlphaViewOutput

- (void)setupView {

}

- (void)sendDataButtonClicked {
    
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;    
        // Intermodule Data Transfer Example. Вызов. Шаг 2. Презентер вызывает роутер для передачи данных в другой модуль.
        [sself.router openBetaModuleWithExampleString:data];
    }];
}

#pragma mark - RamblerModuleAlphaInteractorOutput

@end