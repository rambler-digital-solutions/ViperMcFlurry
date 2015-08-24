//
//  RamblerModuleAlphaRouterInput.h
//  RamblerMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 10/08/15.
//  Copyright 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleAlphaRouterInput <NSObject>

// Intermodule Data Transfer Example. Конфигурация. Шаг 6. Роутер модуля, который отправляет данные должен реализовать метод иницализации
// другого модуля и передачи данных в него.
- (void)openBetaModuleWithExampleString:(NSString*)exampleString;

@end

