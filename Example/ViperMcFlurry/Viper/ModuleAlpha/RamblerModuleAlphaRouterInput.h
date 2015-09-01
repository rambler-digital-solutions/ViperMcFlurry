//
//  RamblerModuleAlphaRouterInput.h
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 10/08/15.
//  Copyright 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleAlphaRouterInput <NSObject>

// Intermodule Data Transfer Example. Конфигурация. Шаг 6. Роутер модуля, который отправляет данные должен реализовать метод иницализации
// другого модуля и передачи данных в него.
- (void)openBetaModuleWithExampleString:(NSString*)exampleString;

// Внедрение модуля Beta с передачей в него конфигурации.
- (void)embedBetaModuleWithExampleString:(NSString*)exampleString;

// Создание модуля Beta из фабрики с передачей в него конфигурации.
- (void)instantiateBetaModuleWithExampleString:(NSString*)exampleString;

// Создание и внедрение модуля Beta из фабрики с передачей в него конфигурации.
- (void)instantiateAndEmbedBetaModuleWithExampleString:(NSString*)exampleString;

@end

