//
//  ExampleModuleAssembly.swift
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//

import UIKit
import Typhoon

public class ExampleModuleAssembly: TyphoonAssembly {

	enum ViperSEL: Selector {
        case view = "view"
        case interactor = "interactor"
        case router = "router"
        case output = "output"
    }

	public dynamic func viewExample() -> AnyObject {
		return TyphoonDefinition.withClass(ExampleView.self) {
			(definition) in 
			
			/*
			//use for init from nib
			definition.useInitializer("initWithNibName:bundle:") {
				(initializer) in

				initializer.injectParameterWith(TyphoonConfig("//XibName//"))
				initializer.injectParameterWith(NSBundle.mainBundle())
			}*/

			definition.injectProperty(ViperSEL.output.rawValue, with: self.presenterExample())
		}
	}


	public dynamic func interactorExample() -> AnyObject {
		return TyphoonDefinition.withClass(ExampleInteractor.self){
            (definition) in
            
            definition.injectProperty(ViperSEL.output.rawValue, with: self.presenterExample())
        }
	}


	public dynamic func presenterExample() -> AnyObject {
		return TyphoonDefinition.withClass(ExamplePresenter.self){
            (definition) in
            
            definition.injectProperty(ViperSEL.view.rawValue, with: self.viewExample())
            definition.injectProperty(ViperSEL.interactor.rawValue, with: self.interactorExample())
            definition.injectProperty(ViperSEL.router.rawValue, with: self.routerExample())
        }
	}


	public dynamic func routerExample() -> AnyObject {
		return TyphoonDefinition.withClass(ExampleRouter.self){
            (definition) in
           
        }
	}
}