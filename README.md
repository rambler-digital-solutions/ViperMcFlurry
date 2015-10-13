# VIPER McFlurry

## Description

**VIPER McFlurry** is a modern framework for implementing VIPER architecture in iOS application. It offers several tools and components that helps either start new projects with VIPER or move from MVC.

Also it icludes **Templates** folder with XCode templates for VIPER modules.

## Install

**ViperMcFlurryPod**

Add to podfile

```ruby
pod "ViperMcFlurryPod"
```

**Templates**

Copy contents of *Templates/File Templates* folder into `~/Library/Developer/Xcode/Templates/File Templates`


## Authors

**Rambler&Co** team:

- Andrey Zarembo-Godzyatsky / a.zarembo-godyzatsky@rambler-co.ru
- Valery Popov / v.popov@rambler-co.ru

## Project History

- v0.1 - Forked VIPER components from internal projects


## How to add Intermodule transition ##

This works only for Module with ViewController as View.

- Create Module input protocol for target module inherited from 'RamblerViperModuleInput'

```
@protocol SomeModuleInput <RamblerViperModuleInput>

- (void)moduleConfigurationMethod;
		
@end
```    

- Make Presenter of target module conform to this protocol
- Inject Presenter as moduleInput property of the view. You can skip this step in presenter as property with name "output"
- Add Segue from source module ViewController to target module ViewController. 
- Inject Source ViewController into Source Router as property "transition handler"
- In Router method call transition handler to open target module with configuration with segue.

```
[[self.transitionHandler openModuleUsingSegue:SegueIdentifier]
	thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<SomeModuleInput> moduleInput) {
		[moduleInput moduleConfigurationMethod];
		return nil;
	}];

```

## Working with Module output ##

- Create Module output protocol for target module inherited from 'RamblerViperModuleOutput'

```
@protocol SomeModuleOutput <RamblerViperModuleOutput>

- (void)moduleConfigurationMethod;
		
@end
```    
- Make source module presenter to conform to this protocol
- Add to target module presenter method 

```
- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput;
```

- Return source module presenter from configuration block in router

```
[[self.transitionHandler openModuleUsingSegue:SegueIdentifier]
	thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<SomeModuleInput> moduleInput) {
		[moduleInput moduleConfigurationMethod];
		return sourceRouterPresenter; // Return of module output
	}];

```

## Working with cross storyboard segues

- Add "RamblerViperPlaceholderViewControllerAssembly" to your initial Typhoon assemblies. Plist or AppDelegate method
- Create ViewController in source ViewController's storyboard
- Set it's class to "RamblerViperPlaceholderViewController"
- Set it's Restoration Id to format "TargetViewControllerStoryboardId@TargetViewControllerStoryboardName" e.g. "RamblerModuleBetaViewController@TestStoryboard"
- Create segue from source ViewController to this PlaceholderViewController

## Embeddable modules

- Make source ViewController to conform "RamblerViperEmbedModuleContainer" protocol and return container view in method

```
- (UIView*)viewForSegue:(NSString*)segueIdentifier;
```
- Create "RamblerViperEmbedModuleSegue" from sourceViewController to targetViewController. 
- Use it as usual segue to send data between modules