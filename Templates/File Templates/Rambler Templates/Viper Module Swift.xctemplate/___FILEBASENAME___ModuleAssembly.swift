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

import UIKit
import Typhoon

public class ___FILEBASENAMEASIDENTIFIER___ModuleAssembly: TyphoonAssembly {

	enum ViperSEL: Selector {
        case view = "view"
        case interactor = "interactor"
        case router = "router"
        case output = "output"
    }

	public dynamic func view___FILEBASENAMEASIDENTIFIER___() -> AnyObject {
		return TyphoonDefinition.withClass(___FILEBASENAMEASIDENTIFIER___View.self) {
			(definition) in 
			
			/*
			//use for init from nib
			definition.useInitializer("initWithNibName:bundle:") {
				(initializer) in

				initializer.injectParameterWith(TyphoonConfig("//XibName//"))
				initializer.injectParameterWith(NSBundle.mainBundle())
			}*/

			definition.injectProperty(ViperSEL.output.rawValue, with: self.presenter___FILEBASENAMEASIDENTIFIER___())
		}
	}


	public dynamic func interactor___FILEBASENAMEASIDENTIFIER___() -> AnyObject {
		return TyphoonDefinition.withClass(___FILEBASENAMEASIDENTIFIER___Interactor.self){
            (definition) in
            
            definition.injectProperty(ViperSEL.output.rawValue, with: self.presenter___FILEBASENAMEASIDENTIFIER___())
        }
	}


	public dynamic func presenter___FILEBASENAMEASIDENTIFIER___() -> AnyObject {
		return TyphoonDefinition.withClass(___FILEBASENAMEASIDENTIFIER___Presenter.self){
            (definition) in
            
            definition.injectProperty(ViperSEL.view.rawValue, with: self.view___FILEBASENAMEASIDENTIFIER___())
            definition.injectProperty(ViperSEL.interactor.rawValue, with: self.interactor___FILEBASENAMEASIDENTIFIER___())
            definition.injectProperty(ViperSEL.router.rawValue, with: self.router___FILEBASENAMEASIDENTIFIER___())
        }
	}


	public dynamic func router___FILEBASENAMEASIDENTIFIER___() -> AnyObject {
		return TyphoonDefinition.withClass(___FILEBASENAMEASIDENTIFIER___Router.self){
            (definition) in
           
        }
	}
}