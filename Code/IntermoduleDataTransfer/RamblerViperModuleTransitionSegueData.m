//
//  RamblerViperModuleTransitionSegueData.m
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 24/08/15.
//
//

#import "RamblerViperModuleTransitionSegueData.h"

@interface RamblerViperModuleTransitionSegueData()

@property (nonatomic,strong) id sender;
@property (nonatomic,strong) id<RamblerViperModuleConfigurationPromiseProtocol> promise;

@end

@implementation RamblerViperModuleTransitionSegueData

+ (instancetype)segueDataWithSender:(id)sender andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise {
    return [[RamblerViperModuleTransitionSegueData alloc] initWithSender:sender
                                                              andPromise:promise];
}
- (instancetype)initWithSender:(id)sender andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise {
    self = [super init];
    if (self) {
        self.sender = sender;
        self.promise = promise;
    }
    return self;
}

@end
