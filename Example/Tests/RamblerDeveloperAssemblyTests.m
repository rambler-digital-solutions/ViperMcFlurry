//
//  RamblerDeveloperAssemblyTests.m
//  RamblerMcFlurry
//
//  Created by Egor Tolstoy on 29/07/15.
//  Copyright © 2015 Egor Tolstoy. All rights reserved.
//

#import <RamblerMcFlurry/Testing.h>

#import "RamblerDeveloperAssembly.h"
#import "RamblerDeveloper.h"
#import "RamblerDevice.h"

@interface RamblerDeveloperAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) RamblerDeveloperAssembly *assembly;

@end

@implementation RamblerDeveloperAssemblyTests

- (void)setUp {
    [super setUp];
    
    self.assembly = [[RamblerDeveloperAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;
    
    [super tearDown];
}

- (void)testThatAssemblyCreatesEgorTolstoy {
    // given
    Class targetClass = [RamblerDeveloper class];
    NSArray *dependencies = @[
                              RamblerSelector(name),
                              RamblerSelector(device)
                              ];
    
    // when
    id result = [self.assembly egorTolstoy];
    
    // then
    [self verifyTargetDependency:result withClass:targetClass dependencies:dependencies];
}

@end
