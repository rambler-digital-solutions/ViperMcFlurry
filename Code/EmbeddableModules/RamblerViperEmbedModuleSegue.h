//
//  RamblerViperEmbedModuleSegue.h
//  VIPER McFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Специальный Segue для внедрения одних модулей в другие в контейнерный View
 */
@interface RamblerViperEmbedModuleSegue : UIStoryboardSegue

/**
 View-контейнер, в который будет добавлен view встраиваемого модуля. К нему будут автоматически примерены
 LayourConstraints, привязывающие границы view модуля к границам контейнера.
 */
@property (nonatomic,strong) UIView* containerView;

@end
