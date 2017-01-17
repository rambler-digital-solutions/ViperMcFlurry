//
//  RamblerModuleGammaModuleAssembly.h
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol RamblerViperModuleFactoryProtocol;

@interface RamblerModuleGammaModuleAssembly : TyphoonAssembly

- (id<RamblerViperModuleFactoryProtocol>)factoryGammaModule;

@end

