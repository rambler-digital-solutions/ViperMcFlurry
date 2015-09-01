//
//  RamblerViperEmbedModuleTransitionSegueData.m
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 21/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerViperEmbedModuleTransitionSegueData.h"

@interface RamblerViperEmbedModuleTransitionSegueData ()

@property (nonatomic,strong) UIView *containerView;

@end

@implementation RamblerViperEmbedModuleTransitionSegueData

- (instancetype)initWithSender:(id)sender
                    andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise
              andContainerView:(UIView*)containerView {

    self = [super initWithSender:sender andPromise:promise];
    if (self) {
        self.containerView = containerView;
    }
    return self;
}

@end
