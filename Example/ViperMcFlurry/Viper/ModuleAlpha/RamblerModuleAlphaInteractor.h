//
//  RamblerModuleAlphaInteractor.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaInteractorInput.h"

@protocol RamblerModuleAlphaInteractorOutput;

@interface RamblerModuleAlphaInteractor : NSObject <RamblerModuleAlphaInteractorInput>

@property (nonatomic, weak) id<RamblerModuleAlphaInteractorOutput> output;

@end

