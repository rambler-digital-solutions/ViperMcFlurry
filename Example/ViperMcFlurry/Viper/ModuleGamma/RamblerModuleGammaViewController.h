//
//  RamblerModuleGammaViewController.h
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RamblerModuleGammaViewInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RamblerViperModuleConfiguratorProtocol;
@protocol RamblerModuleGammaViewOutput;

@interface RamblerModuleGammaViewController : UIViewController <RamblerModuleGammaViewInput,RamblerViperModuleTransitionHandlerProtocol>

@property (nonatomic, strong) id<RamblerModuleGammaViewOutput> output;
@property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@property (nonatomic, strong) IBOutlet UILabel *exampleStringLabel;

@end

