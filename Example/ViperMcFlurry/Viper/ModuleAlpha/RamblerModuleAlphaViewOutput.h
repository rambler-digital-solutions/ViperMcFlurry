//
//  RamblerModuleAlphaViewOutput.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RamblerModuleAlphaViewOutput <NSObject>

- (void)setupView;
- (void)sendDataButtonClicked;
- (void)instantiateBetaButtonClicked;
- (void)instantiateGammaButtonClicked;

@end

