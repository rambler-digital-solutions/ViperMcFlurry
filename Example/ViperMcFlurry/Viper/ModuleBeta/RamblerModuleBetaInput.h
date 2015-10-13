//
//  RamblerModuleBetaInput.h
//  ViperMcFlurry
//
//  Created by Andrey Zarembo-Godzyatsky on 10/08/15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RamblerModuleBetaInput <RamblerViperModuleInput>

- (void)configureWithExampleString:(NSString*)exampleString;

@end
