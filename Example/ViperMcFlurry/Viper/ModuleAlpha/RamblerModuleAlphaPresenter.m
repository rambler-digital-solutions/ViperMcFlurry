//
//  RamblerModuleAlphaPresenter.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerModuleAlphaPresenter.h"
#import "RamblerModuleAlphaViewInput.h"
#import "RamblerModuleAlphaInteractorInput.h"
#import "RamblerModuleAlphaRouterInput.h"

@interface RamblerModuleAlphaPresenter()

@end

@implementation RamblerModuleAlphaPresenter

#pragma mark - RamblerModuleAlphaViewOutput

- (void)setupView {

}

- (void)sendDataButtonClicked {
    
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;    
        [sself.router openBetaModuleWithExampleString:data];
    }];
}

- (void)instantiateBetaButtonClicked {
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;
        [sself.router instantiateBetaModuleWithExampleString:data];
    }];
}

- (void)instantiateGammaButtonClicked {
    __weak typeof(self) wself = self;
    [self.view getDataWithResultBlock:^(NSString *data) {
        typeof (self) sself = wself;
        [sself.router instantiateGammaModuleWithExampleString:data];
    }];
}

#pragma mark - RamblerModuleAlphaInteractorOutput

@end
