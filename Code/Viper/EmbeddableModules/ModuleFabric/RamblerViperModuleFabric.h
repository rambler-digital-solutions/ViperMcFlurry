//
//  RamblerViperModuleFabric.h
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleFabricProtocol.h"

/**
 Универсальная фабрика для VIPER-модулей, инстанс создается в Assembly модуля с использованием инициализатора, в который передается 
 объект TyphoonStoryboard, а также RestorationId для ViewController этого модуля.
 
 При вызове метода instantiateModuleFromTransitionHandler: фабрика создает инстанс ViewController из Storyboard, при этом инициализируется модуль
 благодаря использованию Typhoon.
 */
@interface RamblerViperModuleFabric : NSObject<RamblerViperModuleFabricProtocol>

- (instancetype)initWithStoryboard:(UIStoryboard*)storyboard andRestorationId:(NSString*)restorationId;

@property (nonatomic,strong,readonly) UIStoryboard *storyboard;
@property (nonatomic,strong,readonly) NSString* restorationId;

@end
