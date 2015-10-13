//
//  RamblerModuleBetaViewController.h
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <UIKit/UIKit.h>
#import "RamblerModuleBetaViewInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RamblerViperModuleConfiguratorProtocol;
@protocol RamblerModuleBetaViewOutput;

@interface RamblerModuleBetaViewController : UIViewController <RamblerModuleBetaViewInput,RamblerViperModuleTransitionHandlerProtocol>

@property (nonatomic, strong) id<RamblerModuleBetaViewOutput> output;
@property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@property (nonatomic, strong) IBOutlet UILabel *exampleStringLabel;

- (IBAction)didClickRemoveModuleButton:(id)sender;

@end

