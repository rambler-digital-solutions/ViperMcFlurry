//
//  RamblerModuleAlphaViewController.h
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import <UIKit/UIKit.h>
#import "RamblerModuleAlphaViewInput.h"
#import <RamblerMcFlurry/Viper.h>

@protocol RamblerModuleAlphaViewOutput;

/**
 
 */
// Intermodule Data Transfer Example. Когфигурация. Шаг 5. Контроллер модуля, который будет отправлять данные
// должен реализовать протокол RamblerViperModuleTransitionHandler.
@interface RamblerModuleAlphaViewController : UIViewController <RamblerModuleAlphaViewInput,RamblerViperModuleTransitionHandler>

@property (nonatomic, strong) id<RamblerModuleAlphaViewOutput> output;

@property (nonatomic, weak) IBOutlet UITextField *textField;
- (IBAction)didClickSendDataButton:(id)sender;

@end

