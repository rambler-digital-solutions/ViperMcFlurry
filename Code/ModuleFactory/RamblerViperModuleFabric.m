
//
//  RamblerViperModuleFabric.m
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperModuleFabric.h"
#import "RamblerViperModuleFabricInstantiationPromise.h"
#import "RamblerViperModuleTransitionHandlerProtocol.h"

@interface RamblerViperModuleFabric ()

@property (nonatomic,strong) UIStoryboard *storyboard;
@property (nonatomic,strong) NSString* restorationId;

@end

@implementation RamblerViperModuleFabric

- (instancetype)initWithStoryboard:(UIStoryboard*)storyboard andRestorationId:(NSString*)restorationId {
    self = [super init];
    if (self) {
        self.storyboard = storyboard;
        self.restorationId = restorationId;
    }
    return self;
}

#pragma mark - RDSModuleFabricProtocol

- (id<RamblerViperModuleFabricInstantiationPromiseProtocol>)instantiateModuleFromTransitionHandler:(id<RamblerViperModuleTransitionHandlerProtocol>)transitionHandler {
    
    id destinationViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.restorationId];
    RamblerViperModuleFabricInstantiationPromise * promise = [[RamblerViperModuleFabricInstantiationPromise alloc] initWithSourceViewController:transitionHandler
                                                                                                andDestinationViewController:destinationViewController];
    return promise;
}

@end
