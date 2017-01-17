//
//  RamblerModuleAlphaRouter.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaRouterInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@interface RamblerModuleAlphaRouter : NSObject <RamblerModuleAlphaRouterInput>

@property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property (nonatomic,strong) id<RamblerViperModuleFactoryProtocol> betaModuleFactory;
@property (nonatomic,strong) id<RamblerViperModuleFactoryProtocol> gammaModuleFactory;

@end
