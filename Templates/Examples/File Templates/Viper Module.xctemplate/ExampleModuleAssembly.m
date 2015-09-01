//
//  ExampleModuleAssembly.m
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//

#import "ExampleModuleAssembly.h"
#import "ExampleViewController.h"
#import "ExampleInteractor.h"
#import "ExamplePresenter.h"
#import "ExampleRouter.h"

@interface  ExampleModuleAssembly()

@end

@implementation  ExampleModuleAssembly

- (ExampleViewController *)viewExample {

    return [TyphoonDefinition withClass:[ExampleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterExample]];
             }];
}

- (ExampleInteractor *)interactorExample {

    return [TyphoonDefinition withClass:[ExampleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenterExample]];
             }];
}

- (ExamplePresenter *)presenterExample {

    return [TyphoonDefinition withClass:[ExamplePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(view) 
                                                  with:[self viewExample]];                                            
                            [definition injectProperty:@selector(interactor) 
                                                  with:[self interactorExample]];
                            [definition injectProperty:@selector(router) 
                                                  with:[self routerExample]];
            }];
}

- (ExampleRouter *)routerExample {
    return [TyphoonDefinition withClass:[ExampleRouter class]];
}

@end