//
//  RamblerModuleBetaModuleAssembly.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol RamblerViperModuleFactoryProtocol;

@interface RamblerModuleBetaModuleAssembly : TyphoonAssembly

- (id<RamblerViperModuleFactoryProtocol>)factoryBetaModule;

@end

