//
//  RamblerModuleGammaModuleAssembly.m
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import "RamblerModuleGammaModuleAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

#import "RamblerModuleGammaViewController.h"
#import "RamblerModuleGammaInteractor.h"
#import "RamblerModuleGammaPresenter.h"
#import "RamblerModuleGammaRouter.h"


@interface  RamblerModuleGammaModuleAssembly()

@end

@implementation  RamblerModuleGammaModuleAssembly

- (id<RamblerViperModuleFactoryProtocol>)factoryGammaModule {
    return [TyphoonDefinition withClass:[RamblerViperModuleFactory class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithViewControllerLoader:andViewControllerIdentifier:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:[self nibLoaderGammaModule]];
                                                  [initializer injectParameterWith:@"RamblerModuleGammaViewController"];
                                              }];
                          }];
}

- (id)nibLoaderGammaModule {
    return [TyphoonDefinition withClass:[TyphoonNibLoader class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(nibLoaderWithFactory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:nil];
                                              }];
                          }];
}

- (RamblerModuleGammaViewController *)viewRamblerModuleGamma {

    return [TyphoonDefinition withClass:[RamblerModuleGammaViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterRamblerModuleGamma]];
             }];
}

- (RamblerModuleGammaInteractor *)interactorRamblerModuleGamma {

    return [TyphoonDefinition withClass:[RamblerModuleGammaInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterRamblerModuleGamma]];
             }];
}

- (RamblerModuleGammaPresenter *)presenterRamblerModuleGamma {

    return [TyphoonDefinition withClass:[RamblerModuleGammaPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(view) 
                                                  with:[self viewRamblerModuleGamma]];                                            
                            [definition injectProperty:@selector(interactor) 
                                                  with:[self interactorRamblerModuleGamma]];
                            [definition injectProperty:@selector(router) 
                                                  with:[self routerRamblerModuleGamma]];
            }];
}

- (RamblerModuleGammaRouter *)routerRamblerModuleGamma {
    return [TyphoonDefinition withClass:[RamblerModuleGammaRouter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(transitionHandler)
                              with:[self viewRamblerModuleGamma]];
    }];
}

@end
