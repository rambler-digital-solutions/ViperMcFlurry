//
//  RamblerModuleBetaModuleAssembly.m
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleBetaModuleAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

#import "RamblerModuleBetaViewController.h"
#import "RamblerModuleBetaInteractor.h"
#import "RamblerModuleBetaPresenter.h"
#import "RamblerModuleBetaRouter.h"


@interface  RamblerModuleBetaModuleAssembly()

@end

@implementation  RamblerModuleBetaModuleAssembly

- (id<RamblerViperModuleFabricProtocol>)fabricBetaModule {
    return [TyphoonDefinition withClass:[RamblerViperModuleFabric class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithStoryboard:andRestorationId:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:[self storyboardBetaModule]];
                                                  [initializer injectParameterWith:@"RamblerModuleBetaViewController"];
                                              }];
                          }];
}

- (UIStoryboard*)storyboardBetaModule {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(storyboardWithName:factory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@"Main"];
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:nil];
                                              }];
                          }];
}

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
    return [TyphoonDefinition withClass:[RamblerModuleBetaRouter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(transitionHandler)
                              with:[self viewRamblerModuleBeta]];
    }];
}

@end