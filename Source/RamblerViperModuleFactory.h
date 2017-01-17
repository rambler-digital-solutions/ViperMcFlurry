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

/**
 @param loader The object which loads the view controller, loader should respond to instantiateViewControllerWithIdentifier:. E.g. UIStoryboard or TyphoonNibLoader.
 @param identifier The view controller's identifier. E.g. storyboard ID for UIStoryboard or nib name for TyphoonNibLoader.
 */
- (instancetype)initWithViewControllerLoader:(id)loader andViewControllerIdentifier:(NSString*)identifier;

- (instancetype)initWithStoryboard:(UIStoryboard*)storyboard andRestorationId:(NSString*)restorationId __attribute__((deprecated("use initWithViewControllerKeeper:andViewControllerIdentifier: instead.")));
- (instancetype)initWithViewHandler:(id<RamblerViperModuleTransitionHandlerProtocol>(^)(void))viewHandler;

@property (nonatomic,strong,readonly) UIStoryboard *storyboard __attribute__((deprecated("use viewControllerLoader instead.")));
@property (nonatomic,strong,readonly) NSString* restorationId __attribute__((deprecated("use viewControllerIdentifier instead.")));

@property (nonatomic,strong,readonly) id viewControllerLoader;
@property (nonatomic,strong,readonly) NSString* viewControllerIdentifier;

@end
