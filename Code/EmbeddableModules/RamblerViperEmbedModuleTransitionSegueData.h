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
 This object is used to store segue data during transition. In addition to super class it stores view container
 for embedded module view.
 */
@interface RamblerViperEmbedModuleTransitionSegueData : RamblerViperModuleTransitionSegueData

@property (nonatomic,strong,readonly) UIView *containerView;

- (instancetype)initWithSender:(id)sender
                    andPromise:(id<RamblerViperModuleConfigurationPromiseProtocol>)promise
              andContainerView:(UIView*)containerView;

@end
