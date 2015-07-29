//
//  RamblerDeveloperAssembly.m
//  RamblerMcFlurry
//
//  Created by Egor Tolstoy on 29/07/15.
//  Copyright © 2015 Egor Tolstoy. All rights reserved.
//

#import "RamblerDeveloperAssembly.h"

#import "RamblerDeveloper.h"
#import "RamblerDevice.h"

@implementation RamblerDeveloperAssembly

- (RamblerDeveloper *)egorTolstoy {
    return [TyphoonDefinition withClass:[RamblerDeveloper class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(name)
                                                    with:@"Egor Tolstoy"];
                              [definition injectProperty:@selector(device)
                                                    with:[self iPhone6Plus]];
    }];
}

- (RamblerDeveloper *)andreyRezanov {
    return [TyphoonDefinition withClass:[RamblerDeveloper class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(name)
                                                    with:@"Andrey Rezanov"];
                              [definition injectProperty:@selector(device)
                                                    with:[self nokia3310]];
                          }];
}

- (RamblerDevice *)iPhone6Plus {
    return [TyphoonDefinition withClass:[RamblerDevice class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(deviceName)
                                                    with:@"iPhone 6+"];
    }];
}

- (RamblerDevice *)nokia3310 {
    return [TyphoonDefinition withClass:[RamblerDevice class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(deviceName)
                                                    with:@"Nokia 3310"];
                          }];
}

@end
