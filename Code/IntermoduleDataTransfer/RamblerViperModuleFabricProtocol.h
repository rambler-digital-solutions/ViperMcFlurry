//
//  RamblerViperModuleFabricProtocol.h
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerViperModuleTransitionHandlerProtocol;

@protocol RamblerViperModuleFabricProtocol <NSObject>

- (__nullable id<RamblerViperModuleTransitionHandlerProtocol>)instantiateModuleTransitionHandler;

@end
