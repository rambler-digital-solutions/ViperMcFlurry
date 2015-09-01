//
//  RamblerViperEmbedModuleTransitionSegueData.h
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleTransitionSegueData.h"

/**
 Объект для хранения данных при переходе между модулями через Segue. Дополнительно к родительскогому объекту
 хранит контейнер для встаиваемого модуля
 */
@interface RamblerViperEmbedModuleTransitionSegueData : RamblerViperModuleTransitionSegueData

@property (nonatomic,strong,readonly) UIView *containerView;

- (instancetype)initWithSender:(id)sender
                    andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise
              andContainerView:(UIView*)containerView;

@end
