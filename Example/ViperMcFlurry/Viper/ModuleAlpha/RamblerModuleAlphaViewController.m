//
//  RamblerModuleAlphaViewController.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerModuleAlphaViewController.h"
#import "RamblerModuleAlphaViewOutput.h"

@interface RamblerModuleAlphaViewController()

@end

@implementation RamblerModuleAlphaViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output setupView];
}

- (void)didClickSendDataButton:(id)sender {
    [self.textField resignFirstResponder];
    [self.output sendDataButtonClicked];
}

- (IBAction)didClickInstantiateBetaButton:(id)sender {
    [self.textField resignFirstResponder];
    [self.output instantiateBetaButtonClicked];
}

- (IBAction)didClickInstantiateGammaButton:(id)sender {
    [self.textField resignFirstResponder];
    [self.output instantiateGammaButtonClicked];
}

#pragma mark - RamblerModuleAlphaViewInput

- (void)getDataWithResultBlock:(AlphaModuleViewDataResulBlock)resultBlock {
    
    if (resultBlock) {
        resultBlock(self.textField.text);
    }
}

#pragma mark - RamblerViperEmbedModuleContainer

- (UIView *)viewForSegue:(NSString *)segueIdentifier {
    return self.moduleContainerView;
}

@end
