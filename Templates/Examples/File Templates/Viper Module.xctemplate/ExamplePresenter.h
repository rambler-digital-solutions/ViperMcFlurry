//
//  ExamplePresenter.h
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//

#import <Foundation/Foundation.h>
#import "ExampleViewOutput.h"
#import "ExampleInteractorOutput.h"

@protocol ExampleViewInput;
@protocol ExampleInteractorInput;
@protocol ExampleRouterInput;

/**
 
 */
@interface ExamplePresenter : NSObject <ExampleViewOutput, ExampleInteractorOutput>

@property (nonatomic, weak) id<ExampleViewInput> view;
@property (nonatomic, strong) id<ExampleInteractorInput> interactor;
@property (nonatomic, strong) id<ExampleRouterInput> router;

@end

