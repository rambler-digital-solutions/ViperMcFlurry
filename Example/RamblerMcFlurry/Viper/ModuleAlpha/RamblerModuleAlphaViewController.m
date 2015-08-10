//
//  RamblerModuleAlphaViewController.m
//  Проект:   RamblerMcFlurry
//
//  Модуль:   RamblerModuleAlpha
//  Описание: Первый модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleAlphaViewController.h"
#import "RamblerModuleAlphaViewOutput.h"

@interface RamblerModuleAlphaViewController()

@end

@implementation RamblerModuleAlphaViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output setupView];
}

- (void)didClickSendDataButton:(id)sender {
    // Intermodule Data Transfer Example. Вызов. Шаг 1. Отправка данных в презентер
    [self.output sendData:self.textField.text];
}

#pragma mark - RamblerModuleAlphaViewInput

#pragma mark - RamblerViperModuleTransitionHandler

- (id<RamblerViperModuleConfigurationPromiseProtocol>)performPromiseSegue:(NSString *)segueIdentifier withSender:(id)sender {
    // Intermodule Data Transfer Example. Вызов. Шаг 4. Создается Promise, он вместе с sender упаковывается в словать и отправляется в поле sender
    // при вызове performSegue. Promise возвращается как результат работы метода.
    return [self default_performPromiseSegue:segueIdentifier
                                  withSender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Intermodule Data Transfer Example. Вызов. Шаг 5. Promise распаковывается из словаря и ему задается свойство ModuleConfigurator. Конфигуратор
    // запрашивается у DestinationViewController по протоколу ModuleConfiguratorHolder.
    [self default_prepareForSegue:segue
                           sender:sender];
}

@end