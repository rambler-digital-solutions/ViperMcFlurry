//
//  ExampleViewController.h
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//

#import <UIKit/UIKit.h>
#import "ExampleViewInput.h"

@protocol ExampleViewOutput;

/**
 
 */
@interface ExampleViewController : UIViewController <ExampleViewInput>

@property (nonatomic, strong) id<ExampleViewOutput> output;

@end

