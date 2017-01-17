
//
//  RamblerViperModuleFactory.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleFactory.h"

@interface RamblerViperModuleFactory ()

@property (nonatomic,strong) UIStoryboard *storyboard;
@property (nonatomic,strong) NSString* restorationId;

@property (nonatomic,strong) id viewControllerLoader;
@property (nonatomic,strong) NSString* viewControllerIdentifier;
@property (nonatomic,copy) id<RamblerViperModuleTransitionHandlerProtocol>(^viewHandler)(void);

@end

@implementation RamblerViperModuleFactory

- (instancetype)initWithViewControllerLoader:(id)loader andViewControllerIdentifier:(NSString*)identifier {
    self = [super init];
    if (self) {
        self.viewControllerLoader = loader;
        self.viewControllerIdentifier = identifier;
    }
    return self;
}

- (instancetype)initWithStoryboard:(UIStoryboard*)storyboard andRestorationId:(NSString*)restorationId {
    self = [super init];
    if (self) {
        self.viewControllerLoader = storyboard;
        self.viewControllerIdentifier = restorationId;
    }
    return self;
}

- (instancetype)initWithViewHandler:(id<RamblerViperModuleTransitionHandlerProtocol>(^)(void))viewHandler {
    self = [super init];
    if (self) {
        self.viewHandler = viewHandler;
    }
    return self;
}

#pragma mark - RDSModuleFactoryProtocol

- (__nullable id<RamblerViperModuleTransitionHandlerProtocol>)instantiateModuleTransitionHandler {
    if (self.viewHandler) {
        return self.viewHandler();
    }
    
    NSAssert([self.viewControllerLoader respondsToSelector:@selector(instantiateViewControllerWithIdentifier:)], @"RamblerViperModuleFactory's view controller loader should respond to instantiateViewControllerWithIdentifier:");
    
    id<RamblerViperModuleTransitionHandlerProtocol> destinationViewController = [self.viewControllerLoader instantiateViewControllerWithIdentifier:self.viewControllerIdentifier];
    return destinationViewController;
}

#pragma mark - Getters

- (UIStoryboard *)storyboard {
    return self.viewControllerLoader;
}

- (NSString *)restorationId {
    return self.viewControllerIdentifier;
}

@end
