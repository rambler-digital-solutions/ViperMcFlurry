# RamblerMcFlurry

## Описание

**RamblerMcFlurry** - это коллекция часто используемых в проектах Rambler&Co компонентов. Исторически сложилось, что файлы такого рода переносились из проекта в проект путем *Cmd+C => Cmd+V*. Этот под - отчаянная попытка исправить положение дел.

Для удобства использования под разбит на отдельные спеки - *Testing*, *Interface*, *Core* и прочие в том же духе.

В настоящий момент в **RamblerMcFlurry** есть следующие хелперы:

- *Interface*
    - *RamblerTableViewAnimator* - Базовый аниматор для *UITableView*
- *Testing*
    - *RamblerTyphoonAssemblyTests* - Базовый класс тестов для *TyphoonAssembly*
- *VIPER*
	- *IntermoduleDataTransfer* - Все необходимые компоненты для передачи данных между VIPER модулями через Segue на основе Promise.

## Установка

**RamblerMcFlurry** находится в наших [CocoaPods](https://gitlab.rambler.ru/groups/cocoapods).

Для того, чтобы установить себе все волшебные хелперы, добавьте в Podfile:

```ruby
pod "RamblerMcFlurry"
```

Если же требуется только определенная группа хелперов, к примеру, для тестирования, то:

```ruby
pod "RamblerMcFlurry/Testing"
```

## Развитие компонента

Хотите добавить для общего пользования хелпер из своего проекта? Чудесно! Не забывайте только следовать нескольким простым правилам:

1. Используйте префикс *Rambler* для всех файлов, классов, enum'ов и прочего добра.
2. Полностью комментируйте интерфейсный файл, не забывая описать, зачем вообще нужен это хелпер.
3. Добавляйте примеры использования хелпера в *Example Project*. А еще лучше - покрывайте тестами.
4. Для каждого добавленного хелпера создаватье ревью в Fisheye.

## Авторы

Доблестная команда Rambler&Co.


## VIPER / IntermoduleDataTransfer

### Передача данных между модулями через Segue с помощью Promise.

Ниже описана стандартная реализация передачи данных между модулями. Она доступна в категории UIViewController+DefaultViperModuleTransitionHandling. 

1. Router при инициализации получает ссылку на ViewController, закрытый протоколом RamblerViperModuleTransitionHandlerProtocol
2. При необходимости перехода в другой модуль с передачей данных Presenter вызывает соответствующий метод у Router с данными для передачи
3. Router вызывает метод **performPromiseSegue:withSender:** в котором создается объект RamblerViperModuleConfigurationPromise
4. Этот promise возвращается в результате метода для вызова thenConfigureWithModuleWithBlock:, который сохраняет блок в Promise.
5. Promise срабатывает после того, как у него будет присвоен блок и конфигуратор модуля в свойстве moduleConfigurator.
6. В п.3 помимо promise создается также объект RamblerViperModuleTransitionSegueData, в который сохраняется sender и promise, а он сам передается в качестве sender в вызове performSegueWithIdentifier:sender:
7. Во время вызоыва prepareForSegue проверяется тип senger, если он RamblerViperModuleTransitionSegueData, то извлекается promise, у целевого viewcontroller у Segue запрашивается конфигуратор модуля и присваивается в promise.
8. Выполняется вызов блока с заданным конфигуратором.
