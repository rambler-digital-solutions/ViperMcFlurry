//
//  ExampleInteractor.h
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//

#import <Foundation/Foundation.h>
#import "ExampleInteractorInput.h"

@protocol ExampleInteractorOutput;

/**
 
 */
@interface ExampleInteractor : NSObject <ExampleInteractorInput>

@property (nonatomic, weak) id<ExampleInteractorOutput> output;

@end

