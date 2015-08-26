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
    [self.textField resignFirstResponder];
    // Intermodule Data Transfer Example. Вызов. Шаг 1. Отправка данных в презентер
    [self.output sendDataButtonClicked];
}

- (void)didClickEmbedBetaButton:(id)sender {
    [self.textField resignFirstResponder];    
    [self.output embedModuleButtonClicked];
}

- (IBAction)didClickInstantiateBetaButton:(id)sender {
    [self.textField resignFirstResponder];
    [self.output instantiateBetaButtonClicked];
}
- (IBAction)didClickInstantiateAndEmbedBetaButton:(id)sender {
    [self.textField resignFirstResponder];
    [self.output instantiateAndEmbedBetaButtonClicked];
}


#pragma mark - RamblerModuleAlphaViewInput

- (void)getDataWithResultBlock:(AlphaModuleViewDataResulBlock)resultBlock {
    
    if (resultBlock) {
        resultBlock(self.textField.text);
    }
}

#pragma mark - RamblerViperModuleTransitionHandlerProtocol

- (id<RamblerViperModuleConfigurationPromiseProtocol>)performPromiseSegue:(NSString *)segueIdentifier withSender:(id)sender {
    // Intermodule Data Transfer Example. Вызов. Шаг 4. Создается Promise, он вместе с sender упаковывается в словать и отправляется в поле sender
    // при вызове performSegue. Promise возвращается как результат работы метода.
    return [self rambler_performPromiseSegue:segueIdentifier withSender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Intermodule Data Transfer Example. Вызов. Шаг 5. Promise распаковывается из словаря и ему задается свойство ModuleConfigurator. Конфигуратор
    // запрашивается у DestinationViewController по протоколу ModuleConfiguratorHolder.
    [self rambler_prepareForSegue:segue sender:sender];
}

- (id<RamblerViperModuleConfigurationPromiseProtocol>)embedModuleWithSegue:(NSString *)segueIdentifier intoContainerView:(UIView *)containerView withSender:(id)sender {
    return [self rambler_embedModuleWithSegue:segueIdentifier
                            intoContainerView:containerView
                                   withSender:sender];
}

- (UIView *)containerViewWithIdentifier:(NSString *)identifier {
    return [self rambler_containerViewWithIdentifier:identifier];
}

@end