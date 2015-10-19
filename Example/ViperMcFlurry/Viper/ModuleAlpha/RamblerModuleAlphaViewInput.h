//
//  RamblerModuleAlphaViewInput.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AlphaModuleViewDataResulBlock)(NSString *data);

@protocol RamblerModuleAlphaViewInput <NSObject>

- (void)getDataWithResultBlock:(AlphaModuleViewDataResulBlock)resultBlock;

@end

