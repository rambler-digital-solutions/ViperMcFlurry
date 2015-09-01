//
//  RamblerViperModuleTransitionSegueData.h
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 24/08/15.
//
//

#import <Foundation/Foundation.h>
#import "RamblerViperModuleConfigurationPromiseProtocol.h"

/**
 Объект для хранения данных при переходе между модулями через Segue. Сохраняет в себе оригинальный sender и promise
 для конфигурации модуля.
 */
@interface RamblerViperModuleTransitionSegueData : NSObject

@property (nonatomic,strong,readonly) id sender;
@property (nonatomic,strong,readonly) id<RamblerViperModuleConfigurationPromiseProtocol> promise;

+ (instancetype)segueDataWithSender:(id)sender andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise;
- (instancetype)initWithSender:(id)sender andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise;

@end
