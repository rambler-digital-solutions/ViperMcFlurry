//
//  RamblerModuleAlphaViewController.m
//  Проект:   ViperMcFlurry
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

#pragma mark - RamblerViperEmbedModuleContainer

- (UIView *)viewForSegue:(NSString *)segueIdentifier {
    return self.moduleContainerView;
}

@end