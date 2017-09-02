package model {
	import files.ProgramSettings;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import global.Utils;
	import model.flashBase.classComponentsFlashBase.ButtonSkinComponent;
	import model.classContents.ClassContent;
	import model.flashBase.classComponentsFlashBase.SpriteSuperClass;
	import model.flashBase.classComponentsFlashBase.TemplateComponent;
	import model.flashBase.classComponentsFlashBase.TextFieldComponent;
	import parsers.components.IComponent;
	import parsers.Parser;
	
	public class ClassContentGenerator implements IComponent
	{
		//=========================================================================
		// CONSTANTS
		//=========================================================================
		
		private const TEXT_FIELD:String = "TextField";
		
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================
		
		protected var _targetClass:Object;
		protected var _classContent:IClassContent;
		protected var _buttons:Vector.<IClassComponent>;
		protected var _textFields:Vector.<IClassComponent>;
		protected var _classPackage:String;
		protected var _classContentText:String = "";
		
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================
		
		public function ClassContentGenerator(targetClass:Object, classPackage:String)
		{
			initialize(targetClass, classPackage);
		}
		
		protected function initialize(targetClass:Object, classPackage:String):void
		{

		}
		
		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================
		
		public function text():String
		{
			var p:IComponent = new Parser(_classContent.text(), Utils.getClassNameByPath(_classPackage), ProgramSettings.structure, ProgramSettings.appearance);
			return p.text();
		}
		
		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================
		
		protected function distributeComponentsNames(names:Vector.<String>):void
		{
			for each (var name:String in names)
			{
				if (name.search("TextField") != -1)
					_textFields.push(new TextFieldComponent(name))
				else if (name.search("Button") != -1)
					_buttons.push(new ButtonSkinComponent(name))
				else
					continue;
			}
		}
		
		protected function getComponentsNames(targetClass:Object):Vector.<String>
		{
			var componentsNames:Vector.<String> = new Vector.<String>();
			var myObject:DisplayObjectContainer = DisplayObjectContainer(targetClass);
			
			for (var i:int = 0; i < myObject.numChildren; i++)
			{
				componentsNames.push(myObject.getChildAt(i).name);
			}
			
			return componentsNames;
		}
		
		protected function addComponent(component:IClassComponent):void
		{
			for each (var item:String in component.importText) 
			{
				_classContent.addComponentImports(item);
			}
			//_classContent.addComponentImports(component.importText);
			_classContent.addComponentDeclaration(component.declarationText);
			_classContent.addComponentInitialization(component.initializationText);
			_classContent.addComponentDestroy(component.destroyText);
		}
	
	}
}