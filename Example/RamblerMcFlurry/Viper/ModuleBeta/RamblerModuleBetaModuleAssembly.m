//
//  RamblerModuleBetaModuleAssembly.m
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleBetaModuleAssembly.h"
#import "RamblerModuleBetaViewController.h"
#import "RamblerModuleBetaInteractor.h"
#import "RamblerModuleBetaPresenter.h"
#import "RamblerModuleBetaRouter.h"

@interface  RamblerModuleBetaModuleAssembly()

@end

@implementation  RamblerModuleBetaModuleAssembly

- (RamblerModuleBetaViewController *)viewRamblerModuleBeta {

    return [TyphoonDefinition withClass:[RamblerModuleBetaViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterRamblerModuleBeta]];
                              
                              // Intermodule Data Transfer Example. Конфигурация. Шаг 4. Assembly должна внедрить в контроллер презентер в свойство
                              // конфигуратора модуля
                              [definition injectProperty:@selector(moduleConfigurator)
                                                    with:[self presenterRamblerModuleBeta]];
             }];
}

- (RamblerModuleBetaInteractor *)interactorRamblerModuleBeta {

    return [TyphoonDefinition withClass:[RamblerModuleBetaInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterRamblerModuleBeta]];
             }];
}

- (RamblerModuleBetaPresenter *)presenterRamblerModuleBeta {

    return [TyphoonDefinition withClass:[RamblerModuleBetaPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(view) 
                                                  with:[self viewRamblerModuleBeta]];                                            
                            [definition injectProperty:@selector(interactor) 
                                                  with:[self interactorRamblerModuleBeta]];
                            [definition injectProperty:@selector(router) 
                                                  with:[self routerRamblerModuleBeta]];
            }];
}

- (RamblerModuleBetaRouter *)routerRamblerModuleBeta {
    return [TyphoonDefinition withClass:[RamblerModuleBetaRouter class]];
}

@end