//
//  RamblerModuleAlphaRouterInput.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleAlphaRouterInput <NSObject>

- (void)openBetaModuleWithExampleString:(NSString*)exampleString;
- (void)instantiateBetaModuleWithExampleString:(NSString*)exampleString;
- (void)instantiateGammaModuleWithExampleString:(NSString*)exampleString;

@end

