//
//  RamblerModuleAlphaPresenter.m
//  Проект:   ViperMcFlurry
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
        [sself.router openBetaModuleWithExampleString:data];
    }];
}

- (void)embedModuleButtonClicked {
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;
        [sself.router embedBetaModuleWithExampleString:data];
    }];
}

- (void)instantiateBetaButtonClicked {
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;
        [sself.router instantiateBetaModuleWithExampleString:data];
    }];
}
- (void)instantiateAndEmbedBetaButtonClicked {
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;
        [sself.router instantiateAndEmbedBetaModuleWithExampleString:data];
    }];
}

#pragma mark - RamblerModuleAlphaInteractorOutput

@end