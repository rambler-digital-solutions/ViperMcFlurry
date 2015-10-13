//
//  RamblerModuleAlphaRouterInput.h
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 10/08/15.
//  Copyright 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleAlphaRouterInput <NSObject>

- (void)openBetaModuleWithExampleString:(NSString*)exampleString;

- (void)embedBetaModuleWithExampleString:(NSString*)exampleString;

- (void)instantiateBetaModuleWithExampleString:(NSString*)exampleString;

- (void)instantiateAndEmbedBetaModuleWithExampleString:(NSString*)exampleString;

@end

