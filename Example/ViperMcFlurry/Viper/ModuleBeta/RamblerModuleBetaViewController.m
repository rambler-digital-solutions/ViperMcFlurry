//
//  RamblerModuleBetaViewController.m
//  Проект:   ViperMcFlurry
//
//  Модуль:   RamblerModuleBeta
//  Описание: Второй модуль-пример для Viper IntermoduleDataTransfer
//
//  Создан Andrey Zarembo-Godzyatsky  10/08/15
//  Egor Tolstoy 2015
//

#import "RamblerModuleBetaViewController.h"
#import "RamblerModuleBetaViewOutput.h"
#import <ViperMcFlurry/Viper.h>

@interface RamblerModuleBetaViewController()

@end

@implementation RamblerModuleBetaViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output setupView];
}

- (void)setExampleString:(NSString *)exampleString {
    self.exampleStringLabel.text = exampleString;
}

- (IBAction)didClickRemoveModuleButton:(id)sender {
    [self.output didClickRemoveModuleButton];
}
#pragma mark - RamblerModuleBetaViewInput

- (void)removeFromParentModule {
    [self rambler_removeFromParentModule];
}

@end