//
//  ___FILENAME___
//  Проект:   ___PROJECTNAME___
//
//  Модуль:   ___VARIABLE_viperModuleName___
//  Описание: ___VARIABLE_viperModuleDescription___
//
//  Создан ___FULLUSERNAME___  ___DATE___
//  ___ORGANIZATIONNAME___ ___YEAR___
//

#import "___VARIABLE_viperModuleName___ModuleAssembly.h"
#import "___VARIABLE_viperModuleName___ViewController.h"
#import "___VARIABLE_viperModuleName___Interactor.h"
#import "___VARIABLE_viperModuleName___Presenter.h"
#import "___VARIABLE_viperModuleName___Router.h"

@interface  ___VARIABLE_viperModuleName___ModuleAssembly()

@end

@implementation  ___VARIABLE_viperModuleName___ModuleAssembly

- (___VARIABLE_viperModuleName:identifier___ViewController *)view___VARIABLE_viperModuleName:identifier___ {

    return [TyphoonDefinition withClass:[___VARIABLE_viperModuleName:identifier___ViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenter___VARIABLE_viperModuleName:identifier___]];
             }];
}

- (___VARIABLE_viperModuleName:identifier___Interactor *)interactor___VARIABLE_viperModuleName:identifier___ {

    return [TyphoonDefinition withClass:[___VARIABLE_viperModuleName:identifier___Interactor class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output) 
                                                  with:[self presenter___VARIABLE_viperModuleName:identifier___]];
             }];
}

- (___VARIABLE_viperModuleName:identifier___Presenter *)presenter___VARIABLE_viperModuleName:identifier___ {

    return [TyphoonDefinition withClass:[___VARIABLE_viperModuleName:identifier___Presenter class]
                          configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(view) 
                                                  with:[self view___VARIABLE_viperModuleName:identifier___]];                                            
                            [definition injectProperty:@selector(interactor) 
                                                  with:[self interactor___VARIABLE_viperModuleName:identifier___]];
                            [definition injectProperty:@selector(router) 
                                                  with:[self router___VARIABLE_viperModuleName:identifier___]];
            }];
}

- (___VARIABLE_viperModuleName:identifier___Router *)router___VARIABLE_viperModuleName:identifier___ {
    return [TyphoonDefinition withClass:[___VARIABLE_viperModuleName___Router class]];
}

@end