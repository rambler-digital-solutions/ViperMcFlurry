//
//  RamblerModuleAlphaModuleAssembly.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerModuleAlphaModuleAssembly.h"

#import "RamblerModuleBetaModuleAssembly.h"
#import "RamblerModuleGammaModuleAssembly.h"

#import "RamblerModuleAlphaViewController.h"
#import "RamblerModuleAlphaInteractor.h"
#import "RamblerModuleAlphaPresenter.h"
#import "RamblerModuleAlphaRouter.h"

@interface  RamblerModuleAlphaModuleAssembly()

@property (nonatomic,strong,readonly) RamblerModuleBetaModuleAssembly *betaModuleAssembly;
@property (nonatomic,strong,readonly) RamblerModuleGammaModuleAssembly *gammaModuleAssembly;

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
                              
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewRamblerModuleAlpha]];
                              
                              [definition injectProperty:@selector(betaModuleFactory)
                                                    with:[self.betaModuleAssembly factoryBetaModule]];
                              
                              [definition injectProperty:@selector(gammaModuleFactory)
                                                    with:[self.gammaModuleAssembly factoryGammaModule]];
                          }];
}

@end
