//
//  RamblerModuleBetaModuleAssembly.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol RamblerViperModuleFaсtoryProtocol;

@interface RamblerModuleBetaModuleAssembly : TyphoonAssembly

- (id<RamblerViperModuleFaсtoryProtocol>)factoryBetaModule;

@end

