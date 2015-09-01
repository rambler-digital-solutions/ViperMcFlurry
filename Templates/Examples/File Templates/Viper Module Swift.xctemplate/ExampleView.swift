//
//  ExampleView.swift
//  Проект:   TemplateTester
//
//  Модуль:   Example
//  Описание: Отвечает за демонстрацию возможностей шаблона
//
//  Создан Andrey Zarembo-Godzyatsky  30/07/15
//  Rambler&Co 2015
//

import UIKit

/**
 *  View 
 *	
 */

class ExampleView: UIViewController, ExampleViewInput {
	
	var output: ExampleViewOutput?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
}