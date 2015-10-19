//
//  RamblerModuleAlphaRouter.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerModuleAlphaRouter.h"
#import "RamblerModuleBetaInput.h"

static NSString* const RamblerAlphaToBetaSegue = @"RamblerAlphaToBetaSegue";

@interface RamblerModuleAlphaRouter()

@end

@implementation RamblerModuleAlphaRouter

#pragma mark - RamblerModuleAlphaRouterInput

- (void)openBetaModuleWithExampleString:(NSString*)exampleString {
    
    [[self.transitionHandler openModuleUsingSegue:RamblerAlphaToBetaSegue]
     thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<RamblerModuleBetaInput> moduleInput) {
         [moduleInput configureWithExampleString:exampleString];
         return nil;
     }];
}

- (void)instantiateBetaModuleWithExampleString:(NSString*)exampleString {
    [[self.transitionHandler openModuleUsingFabric:self.betaModuleFabric
                               withTransitionBlock:^(id<RamblerViperModuleTransitionHandlerProtocol> sourceModuleTransitionHandler,
                                                     id<RamblerViperModuleTransitionHandlerProtocol> destinationModuleTransitionHandler) {
                                   
                                   UIViewController *sourceViewController = (id)sourceModuleTransitionHandler;
                                   UIViewController *destinationViewController = (id)destinationModuleTransitionHandler;
                                   
                                   [sourceViewController.navigationController pushViewController:destinationViewController
                                                                                        animated:YES];
        
                               }] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<RamblerModuleBetaInput> moduleInput) {
                                   [moduleInput configureWithExampleString:exampleString];
                                   return nil;
                               }];
}

@end