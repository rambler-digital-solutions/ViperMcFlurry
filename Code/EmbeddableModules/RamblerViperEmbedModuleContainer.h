//
//  RamblerViperEmbedModuleContainer.h
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 25/09/15.
//
//

#import <Foundation/Foundation.h>

/**
 Protocol for viewController, which is used to determine what view should be used for embed segue
 */
@protocol RamblerViperEmbedModuleContainer <NSObject>

- (UIView*)viewForSegue:(NSString*)segueIdentifier;

@end
