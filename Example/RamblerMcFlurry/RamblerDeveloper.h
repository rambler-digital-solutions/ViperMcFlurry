//
//  RamblerDeveloper.h
//  RamblerMcFlurry
//
//  Created by Egor Tolstoy on 29/07/15.
//  Copyright © 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RamblerDevice;

@interface RamblerDeveloper : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) RamblerDevice *device;

@end
