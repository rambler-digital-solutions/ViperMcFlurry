//
//  ExamplePresenter.swift
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//
import Foundation

/**
 *  Presenter 
 *	
 */

class ExamplePresenter: NSObject, ExampleViewOutput, ExampleInteractorOutput {

	weak var view: ExampleViewInput?
	var interactor: ExampleInteractorInput?
	var router: ExampleRouterInput?

	@objc internal func setupView() {
		
	}
}