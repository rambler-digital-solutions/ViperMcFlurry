//
//  RamblerViperModuleInput.h
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 25/09/15.
//
//

#import <Foundation/Foundation.h>

@protocol RamblerViperModuleOutput;

@protocol RamblerViperModuleInput <NSObject>

@optional
- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput;

@end
