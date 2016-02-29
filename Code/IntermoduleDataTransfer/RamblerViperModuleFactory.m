
//
//  RamblerViperModuleFactory.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleFactory.h"

typedef NS_ENUM(NSUInteger, FactoryType)
{
    FactoryTypeStoryboard,
    FactoryTypeCode
};

@interface RamblerViperModuleFactory ()

@property (nonatomic,strong)  UIStoryboard    *storyboard;
@property (nonatomic,strong)  NSString        *restorationId;
@property (nonatomic, strong) TyphoonAssembly *currentAssembly;
@property (nonatomic, copy)   NSString        *currentSelectorName;
@property (nonatomic) 	      FactoryType     factoryType;

@end

@implementation RamblerViperModuleFactory


- (instancetype)initWithAssembly:(TyphoonAssembly *)assembly selectorName:(NSString *)selectorName
{
    self = [super init];
    if (self){
	self.currentAssembly     = assembly;
	self.currentSelectorName = selectorName;
	self.factoryType         = FactoryTypeCode;

    }
    return self;
}

- (instancetype)initWithStoryboard:(UIStoryboard*)storyboard andRestorationId:(NSString*)restorationId {
    self = [super init];
    if (self) {
        self.storyboard    = storyboard;
        self.restorationId = restorationId;
	self.factoryType   = FactoryTypeStoryboard;
    }
    return self;
}

#pragma mark - RDSModuleFactoryProtocol

- (__nullable id<RamblerViperModuleTransitionHandlerProtocol>)instantiateModuleTransitionHandler {
    id <RamblerViperModuleTransitionHandlerProtocol> destinationViewController; 
        switch (self.factoryType)
	{
	    case FactoryTypeStoryboard:
                destinationViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.restorationId];
	        break;
	    case FactoryTypeCode:
		{
                    SEL selector = NSSelectorFromString(self.currentSelectorName);
                    destinationViewController = [self.currentAssembly performSelector:selector];
		}	        
             break;
	}
    return destinationViewController;
}

@end
