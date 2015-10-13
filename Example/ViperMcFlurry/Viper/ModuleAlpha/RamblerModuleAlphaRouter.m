//
//  RamblerModuleAlphaRouter.m
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleAlphaRouter.h"
#import "RamblerModuleBetaInput.h"

static NSString* const RamblerAlphaToBetaSegue = @"RamblerAlphaToBetaSegueFromOtherStoryboard";
static NSString* const EmbedBetaModuleSegue = @"EmbedBetaModuleSegue";

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

- (void)embedBetaModuleWithExampleString:(NSString*)exampleString {
    
    [[self.transitionHandler openModuleUsingSegue:EmbedBetaModuleSegue]
     thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<RamblerModuleBetaInput> moduleInput) {
         [moduleInput configureWithExampleString:exampleString];
         return nil;
     }];    
}

- (void)instantiateBetaModuleWithExampleString:(NSString*)exampleString {

}

- (void)instantiateAndEmbedBetaModuleWithExampleString:(NSString*)exampleString {

}

@end