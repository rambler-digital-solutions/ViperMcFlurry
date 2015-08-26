//
//  RamblerModuleAlphaRouter.m
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleAlphaRouter.h"
#import "RamblerModuleBetaConfigurator.h"

static NSString* const RamblerAlphaToBetaSegue = @"RamblerAlphaToBetaSegue";
static NSString* const EmbedBetaModuleSegue = @"EmbedBetaModuleSegue";

@interface RamblerModuleAlphaRouter()

@end

/**
 
 */
@implementation RamblerModuleAlphaRouter

#pragma mark - RamblerModuleAlphaRouterInput

- (void)openBetaModuleWithExampleString:(NSString*)exampleString {
    
    // Intermodule Data Transfer Example. Вызов. Шаг 3. Роутер вызывает TransitionHandler для выполнения Segue с созданием Promise
    [[self.transitionHandler performPromiseSegue:RamblerAlphaToBetaSegue withSender:self]
     thenConfigureModuleWithBlock:^(id<RamblerModuleBetaConfigurator> viperModuleConfigurator) {
         
         // Intermodule Data Transfer Example. Шаг 6. После задания конфигуратора и блока для выполнения срабатывает Promise и вызывает блок
         // В блок передается в качестве параметра объект конфигуратора, у которого вызываются методы для настройки модуля.
         [viperModuleConfigurator configureWithExampleString:exampleString];
     }];
}

// Внедрение модуля Beta с передачей в него конфигурации.
- (void)embedBetaModuleWithExampleString:(NSString*)exampleString {
    
    [[self.transitionHandler embedModuleWithSegue:EmbedBetaModuleSegue
                               intoContainerView:[self.transitionHandler containerViewWithIdentifier:@"moduleContainerView"]
                                      withSender:self]
     thenConfigureModuleWithBlock:^(id<RamblerModuleBetaConfigurator> viperModuleConfigurator) {
         
         [viperModuleConfigurator configureWithExampleString:exampleString];
     }];
}

// Создание модуля Beta из фабрики с передачей в него конфигурации.
- (void)instantiateBetaModuleWithExampleString:(NSString*)exampleString {
    
    [[[self.betaModuleFabric instantiateModuleFromTransitionHandler:self.transitionHandler]
      andShow]
       thenConfigureModuleWithBlock:^(id<RamblerModuleBetaConfigurator> viperModuleConfigurator) {
         
         [viperModuleConfigurator configureWithExampleString:exampleString];
     }];
}

// Создание и внедрение модуля Beta из фабрики с передачей в него конфигурации.
- (void)instantiateAndEmbedBetaModuleWithExampleString:(NSString*)exampleString {
    
    [[[self.betaModuleFabric instantiateModuleFromTransitionHandler:self.transitionHandler]
      andEmbedIntoContainerView:[self.transitionHandler containerViewWithIdentifier:@"moduleContainerView"]]
       thenConfigureModuleWithBlock:^(id<RamblerModuleBetaConfigurator> viperModuleConfigurator) {
         
         [viperModuleConfigurator configureWithExampleString:exampleString];
     }];
}

@end