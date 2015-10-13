//
//  RamblerViperPlaceholderViewController.h
//  Pods
//
//  Created by Andrey Zarembo-Godzyatsky on 25/09/15.
//
//

#import <UIKit/UIKit.h>
#import <Typhoon/TyphoonComponentFactory.h>

@interface RamblerViperPlaceholderViewController : UIViewController

@property (nonatomic,strong) id<TyphoonComponentFactory> factory;
- (id)destinationViewControllerForSegue;

@end
