//
//  RamblerModuleBetaConfigurator.h
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 10/08/15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/Viper.h>

// Intermodule Data Transfer Example. Конфигурация. Шаг 1. В модуле, которые будет принимать данные необходимо объявить протокол конфигуратора
@protocol RamblerModuleBetaConfigurator <RamblerViperModuleConfiguratorProtocol>

- (void)configureWithExampleString:(NSString*)exampleString;

@end
