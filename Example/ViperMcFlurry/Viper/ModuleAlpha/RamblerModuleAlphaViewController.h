//
//  RamblerModuleAlphaViewController.h
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <UIKit/UIKit.h>
#import "RamblerModuleAlphaViewInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RamblerModuleAlphaViewOutput;

@interface RamblerModuleAlphaViewController : UIViewController <RamblerModuleAlphaViewInput,RamblerViperEmbedModuleContainer>

@property (nonatomic, strong) id<RamblerModuleAlphaViewOutput> output;

@property (nonatomic, weak) IBOutlet UITextField *textField;
- (IBAction)didClickSendDataButton:(id)sender;
- (IBAction)didClickEmbedBetaButton:(id)sender;
- (IBAction)didClickInstantiateBetaButton:(id)sender;
- (IBAction)didClickInstantiateAndEmbedBetaButton:(id)sender;

@property (nonatomic, weak) IBOutlet UIView *moduleContainerView;

@end

