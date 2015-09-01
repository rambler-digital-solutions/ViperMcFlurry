//
//  RamblerModuleAlphaModuleAssembly.m
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleAlphaModuleAssembly.h"

#import "RamblerModuleBetaModuleAssembly.h"

#import "RamblerModuleAlphaViewController.h"
#import "RamblerModuleAlphaInteractor.h"
#import "RamblerModuleAlphaPresenter.h"
#import "RamblerModuleAlphaRouter.h"

@interface  RamblerModuleAlphaModuleAssembly()

@property (nonatomic,strong,readonly) RamblerModuleBetaModuleAssembly *betaModuleAssembly;

@end

@implementation  RamblerModuleAlphaModuleAssembly

- (RamblerModuleAlphaViewController *)viewRamblerModuleAlpha {

    return [TyphoonDefinition withClass:[RamblerModuleAlphaViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterRamblerModuleAlpha]];
             }];
}

- (RamblerModuleAlphaInteractor *)interactorRamblerModuleAlpha {

    return [TyphoonDefinition withClass:[RamblerModuleAlphaInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterRamblerModuleAlpha]];
             }];
}

- (RamblerModuleAlphaPresenter *)presenterRamblerModuleAlpha {

    return [TyphoonDefinition withClass:[RamblerModuleAlphaPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(view) 
                                                  with:[self viewRamblerModuleAlpha]];                                            
                            [definition injectProperty:@selector(interactor) 
                                                  with:[self interactorRamblerModuleAlpha]];
                            [definition injectProperty:@selector(router) 
                                                  with:[self routerRamblerModuleAlpha]];
            }];
}

- (RamblerModuleAlphaRouter *)routerRamblerModuleAlpha {
    return [TyphoonDefinition withClass:[RamblerModuleAlphaRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                              // Intermodule Data Transfer Example. Шаг 1. У роутеру задается TransitionHandler.
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewRamblerModuleAlpha]];
                              
                              [definition injectProperty:@selector(betaModuleFabric)
                                                    with:[self.betaModuleAssembly fabricBetaModule]];
                          }];
}

@end