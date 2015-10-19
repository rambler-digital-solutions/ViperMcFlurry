//
//  RamblerModuleBetaModuleAssembly.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol RamblerViperModuleFabricProtocol;

@interface RamblerModuleBetaModuleAssembly : TyphoonAssembly

- (id<RamblerViperModuleFabricProtocol>)fabricBetaModule;

@end

