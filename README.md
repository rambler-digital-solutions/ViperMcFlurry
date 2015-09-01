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

Ниже описана стандартная реализация передачи данных между модулями. Она доступна в категории UIViewController+RamblerViperModuleTransitionHandling.

1. Router при инициализации получает ссылку на ViewController, закрытый протоколом RamblerViperModuleTransitionHandlerProtocol
2. При необходимости перехода в другой модуль с передачей данных Presenter вызывает соответствующий метод у Router с данными для передачи
3. Router вызывает метод **performPromiseSegue:withSender:** в котором создается объект RamblerViperModuleConfigurationPromise
4. Этот promise возвращается в результате метода для вызова thenConfigureWithModuleWithBlock:, который сохраняет блок в Promise.
5. Promise срабатывает после того, как у него будет присвоен блок и конфигуратор модуля в свойстве moduleConfigurator.
6. В п.3 помимо promise создается также объект RamblerViperModuleTransitionSegueData, в который сохраняется sender и promise, а он сам передается в качестве sender в вызове performSegueWithIdentifier:sender:
7. Во время вызоыва prepareForSegue проверяется тип senger, если он RamblerViperModuleTransitionSegueData, то извлекается promise, у целевого viewcontroller у Segue запрашивается конфигуратор модуля и присваивается в promise.
8. Выполняется вызов блока с заданным конфигуратором.


TODO: добавить в метод andShow проверку на наличие navigationController и если его нет, выполнять modalShow либо добавить modal как отдельный метод.

### Как добавить в приложение передачу данных между модулями через Segue

1. Добавить протокол конфигурации вызываемого модуля, унаследованный от RamblerViperModuleConfiguratorProtocol. Добавить в него необходимые методы конфигурации модуля.  

		В примере это RamblerModuleBetaConfigurator с методом configureWithExampleString:

2. Добавить в Presenter вызываемого модуля реализацию этого протокола

    	В примере это RamblerModuleBetaPresenter

3. Добавить во ViewController вызываемого модуля поддержку протокола RamblerViperModuleConfiguratorHolder. 
    
    	В примере RamblerModuleBetaViewController реализует протокол RamblerViperModuleConfiguratorHolder и получает свойство @property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

4. Связать конфигуратор и холдер.
    
    	В примере это реализовано внутри RamblerModuleBetaModuleAssembly в методе viewRamblerModuleBeta

5. Добавить во ViewController вызываюшего модуля поддержку протокола RamblerViperModuleTransitionHandlerProtocol c реализацией методов performPromiseSegue:witSender: и prepareForSegue:sender:

    	В примере RamblerModuleAlphaViewController реализует данный протокол, а в указанных методах вызывает стандартную реализацию из категории UIViewController+RamblerViperModuleTransitionHandling

6. Добавить в Router вызывающего модуля свойство @property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler; и связать его с ViewController вызывающего модуля.

    	В примере такое свойство добавлено у RamblerModuleAlphaRouter. Его значение задается в RamblerModuleAlphaModuleAssembly в методе routerRamblerModuleAlpha.

7. Добавить в Storyboard Segue, через который требуется пердавать данные.

    	В примере это RamblerAlphaToBetaSegue, который связаывает модули Alpha и Beta

8. Добавить в Router метод, который будет вызываться для перехода в другой модуль с данными. В этом методе у transitionHandler должен вызываться метод performPromiseSegue:withSender: который возвращает promise конфигурации модуля. У этого промиса нужно вызывать метод thenConfigureModuleWithBlock: с блоком конфигурации модуля.
    
    	В примере это метод openBetaModuleWithExampleString. В этом методе четко указан протокол конфигурации модуля Beta, что позволяет указать вызываемый метод configureWithExampleString: и его параметр.

9. При вызове метода у Router будет выполняться Segue и в модуле будет вызыван метод конфигурации.
    

### Как добавить в приложение встраивание одного модуля в другой

1. Добавить протокол конфигурации вызываемого модуля, унаследованный от RamblerViperModuleConfiguratorProtocol. Добавить в него необходимые методы конфигурации модуля.  

		В примере это RamblerModuleBetaConfigurator с методом configureWithExampleString:

2. Добавить в Presenter вызываемого модуля реализацию этого протокола

    	В примере это RamblerModuleBetaPresenter

3. Добавить во ViewController вызываемого модуля поддержку протокола RamblerViperModuleConfiguratorHolder. 
    
    	В примере RamblerModuleBetaViewController реализует протокол RamblerViperModuleConfiguratorHolder и получает свойство @property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

4. Связать конфигуратор и холдер.
    
    	В примере это реализовано внутри RamblerModuleBetaModuleAssembly в методе viewRamblerModuleBeta

5. Добавить во ViewController вызываюшего модуля поддержку протокола RamblerViperModuleTransitionHandlerProtocol c реализацией методов performPromiseSegue:witSender: и prepareForSegue:sender:

    	В примере RamblerModuleAlphaViewController реализует данный протокол, а в указанных методах вызывает стандартную реализацию из категории UIViewController+RamblerViperModuleTransitionHandling

6. Помимо поддержки указанных методов необходимо добавить реализацию метода containerViewWithIdentifier. 
    
    В примере в RamblerModuleAlphaViewController добавлен этот метод с вызовом стандартного обработчика из категории UIViewController+RamblerViperModuleTransitionHandling. Также добавлен View-контейнер UIView *moduleContainerView, который возвращается при запросе контейнера с аналогичным индетификатором. Это стандартное поведение метода из категории. 
    
7. Добавить в Router вызывающего модуля свойство @property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler; и связать его с ViewController вызывающего модуля.

    	В примере такое свойство добавлено у RamblerModuleAlphaRouter. Его значение задается в RamblerModuleAlphaModuleAssembly в методе routerRamblerModuleAlpha.

8. Segue должно быть типом RamblerViperEmbedModuleSegue или его наследником.
    
    	В примере это EmbedBetaModuleSegue

9. В методе Router необходимо вызывать у transitionHandler метод embedModuleWithSegue:intoContainerView:withSender: который возвращает promise конфигурации модуля. У этого промиса нужно вызывать метод thenConfigureModuleWithBlock: с блоком конфигурации модуля.

    	В примере вызывается метод с EmbedBetaModuleSegue. В качестве контейнера возвращается moduleContainerView, который запрашивается у transitionHandler через идентификатор "moduleContainerView". Настройка модуля выполняется аналогично передаче данных через segue.

### Как добавить в приложение создание модуля на фабрике с передачей в него данных

1. Добавить в Assembly вызываемого модуля создание фабрики модулей с типом RamblerViperModuleFabric. У этой фабрики необходимо вызывать инициализатор с указанием Segue и RestorationId для ViewController модуля.

    	В примере такая фабрика создается в RamblerModuleBetaModuleAssembly. Ей в инициализатор передается TyphoonStoryboard созадаваемый в методе storyboardBetaModule и "RamblerModuleBetaViewController" в качестве RestorationId для ViewController. При этом метод, возвращающий фабрику публичный, т.к. он будет использован в настройке Router вызывающего модуля.

2. Добавить протокол конфигурации вызываемого модуля, унаследованный от RamblerViperModuleConfiguratorProtocol. Добавить в него необходимые методы конфигурации модуля.  

		В примере это RamblerModuleBetaConfigurator с методом configureWithExampleString:

3. Добавить в Presenter вызываемого модуля реализацию этого протокола

    	В примере это RamblerModuleBetaPresenter

4. Добавить во ViewController вызываемого модуля поддержку протокола RamblerViperModuleConfiguratorHolder. 
    
    	В примере RamblerModuleBetaViewController реализует протокол RamblerViperModuleConfiguratorHolder и получает свойство @property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

5. Связать конфигуратор и холдер.
    
    	В примере это реализовано внутри RamblerModuleBetaModuleAssembly в методе viewRamblerModuleBeta

6. Добавить во ViewController вызываюшего модуля поддержку протокола RamblerViperModuleTransitionHandlerProtocol c реализацией методов performPromiseSegue:witSender: и prepareForSegue:sender:

    	В примере RamblerModuleAlphaViewController реализует данный протокол, а в указанных методах вызывает стандартную реализацию из категории UIViewController+RamblerViperModuleTransitionHandling

7. Добавить в Router вызывающего модуля свойство @property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler; и связать его с ViewController вызывающего модуля.

    	В примере такое свойство добавлено у RamblerModuleAlphaRouter. Его значение задается в RamblerModuleAlphaModuleAssembly в методе routerRamblerModuleAlpha.

8. В Router вызывающего модуля необходимо добавить связь с фабрикой вызываемых модулей.

    	В примере это свойство betaModuleFabric у RamblerModuleAlphaRouter, которое задается в RamblerModuleAlphaModuleAssembly в методе routerRamblerModuleAlpha. Для этого в RamblerModuleAlphaModuleAssembly добавляется свойство с доступом к RamblerModuleBetaModuleAssembly.

9. Т.к. segue не используется, необходимо задать для контроллера вызываемого модуля RestorationId.

    	В примере это RamblerModuleBetaViewController у контроллера с таким же типом


10. В методе Router необходимо вызывать у фабрики вызываемого модуля метод instantiateModuleFromTransitionHandler: с передачей в него transitionHandler. Этот метод вернет RamblerViperModuleFabricInstantiationPromise, который позволяет выбрать метод добавления модуля. Для перехода
    в новый модуль нужно вызывать метод andShow. Метод вернет Promise настройки вызываемого модуля. Настройка модуля выполняется аналогично передаче данных через segue.

    	В примере вызов похож на передачу данных через segue. Конфигурация выполняется аналогично.

11. Модуль будет сконфигурирован, после чего будет вызыван Push у NavigationController вызывающего модуля.

### Как добавить в приложение создание модуля со встаиванием.

1. Добавить в Assembly вызываемого модуля создание фабрики модулей с типом RamblerViperModuleFabric. У этой фабрики необходимо вызывать инициализатор с указанием Segue и RestorationId для ViewController модуля.

    	В примере такая фабрика создается в RamblerModuleBetaModuleAssembly. Ей в инициализатор передается TyphoonStoryboard созадаваемый в методе storyboardBetaModule и "RamblerModuleBetaViewController" в качестве RestorationId для ViewController. При этом метод, возвращающий фабрику публичный, т.к. он будет использован в настройке Router вызывающего модуля.

2. Добавить протокол конфигурации вызываемого модуля, унаследованный от RamblerViperModuleConfiguratorProtocol. Добавить в него необходимые методы конфигурации модуля.  

		В примере это RamblerModuleBetaConfigurator с методом configureWithExampleString:

3. Добавить в Presenter вызываемого модуля реализацию этого протокола

    	В примере это RamblerModuleBetaPresenter

4. Добавить во ViewController вызываемого модуля поддержку протокола RamblerViperModuleConfiguratorHolder. 
    
    	В примере RamblerModuleBetaViewController реализует протокол RamblerViperModuleConfiguratorHolder и получает свойство @property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

5. Связать конфигуратор и холдер.
    
    	В примере это реализовано внутри RamblerModuleBetaModuleAssembly в методе viewRamblerModuleBeta

6. Помимо поддержки указанных методов необходимо добавить реализацию метода containerViewWithIdentifier. 

		В примере в RamblerModuleAlphaViewController добавлен этот метод с вызовом стандартного обработчика из категории UIViewController+RamblerViperModuleTransitionHandling. Также добавлен View-контейнер UIView *moduleContainerView, который возвращается при запросе контейнера с аналогичным индетификатором. Это стандартное поведение метода из категории. 

7. Добавить в Router вызывающего модуля свойство @property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler; и связать его с ViewController вызывающего модуля.

    	В примере такое свойство добавлено у RamblerModuleAlphaRouter. Его значение задается в RamblerModuleAlphaModuleAssembly в методе routerRamblerModuleAlpha.

8. В Router вызывающего модуля необходимо добавить связь с фабрикой вызываемых модулей.

    	В примере это свойство betaModuleFabric у RamblerModuleAlphaRouter, которое задается в RamblerModuleAlphaModuleAssembly в методе routerRamblerModuleAlpha. Для этого в RamblerModuleAlphaModuleAssembly добавляется свойство с доступом к RamblerModuleBetaModuleAssembly.

9. Т.к. segue не используется, необходимо задать для контроллера вызываемого модуля RestorationId.

    	В примере это RamblerModuleBetaViewController у контроллера с таким же типом


10. В методе Router необходимо вызывать у фабрики вызываемого модуля метод instantiateModuleFromTransitionHandler: с передачей в него transitionHandler. Этот метод вернет RamblerViperModuleFabricInstantiationPromise, который позволяет выбрать метод добавления модуля. Для перехода
в новый модуль нужно вызывать метод andEmbedIntoContainerView: в который передать View-контейнер вызывающего модуля. Метод вернет Promise настройки вызываемого модуля. Настройка модуля выполняется аналогично передаче данных через segue.

    	В примере в качестве контейнера возвращается moduleContainerView, который запрашивается у transitionHandler через идентификатор "moduleContainerView". Настройка модуля выполняется аналогично передаче данных через segue.

11. Модуль будет сконфигурирован, после чего будет создан и выполнен RamblerViperEmbedModuleSegue.

### Как добавить DeepLinking

Реализация DeepLinking в такой концепции сводится к подготовке всех создаваемых при открытии приложения модулей к работе через фабрику, созданию базового Router, который будет создавать эти модули и вызова методов этого Router в методе обработки URL. В качестве TransitionHandler можно указать специальный объект, который будет анализировать текущее состояние окна и ViewController, чтобы корректно сворачивать модальные окна, закрывать настройки и т.п.
