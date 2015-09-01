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

/**
 
 */
// Intermodule Data Transfer Example. Конфигурация. Шаг 3. Контроллер модуля должен реализовать протокол возврата конфигуратора.
@interface RamblerModuleBetaViewController : UIViewController <RamblerModuleBetaViewInput,RamblerViperModuleConfiguratorHolder>

@property (nonatomic, strong) id<RamblerModuleBetaViewOutput> output;
@property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@property (nonatomic, strong) IBOutlet UILabel *exampleStringLabel;

- (IBAction)didClickRemoveModuleButton:(id)sender;

@end

