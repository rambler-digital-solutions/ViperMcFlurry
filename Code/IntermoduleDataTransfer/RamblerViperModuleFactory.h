//
//  RamblerViperModuleFactory.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerViperModuleFactoryProtocol.h"

/**
 Universal Viper module factory.
 */
@interface RamblerViperModuleFactory : NSObject<RamblerViperModuleFactoryProtocol>

- (instancetype)initWithAssembly:(TyphoonAssembly *)assembly selectorName:(NSString *)selectorName
- (instancetype)initWithStoryboard:(UIStoryboard*)storyboard andRestorationId:(NSString*)restorationId;

@property (nonatomic,strong,readonly) UIStoryboard *storyboard;
@property (nonatomic,strong,readonly) NSString* restorationId;

@end
