package model.flashBase {
	import files.ProgramSettings;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import global.Utils;
	import model.ClassContentGenerator;
	import model.flashBase.classComponentsFlashBase.ButtonSkinComponent;
	import model.classContents.ClassContent;
	import model.flashBase.classComponentsFlashBase.SpriteSuperClass;
	import model.flashBase.classComponentsFlashBase.TemplateComponent;
	import model.flashBase.classComponentsFlashBase.TextFieldComponent;
	import model.IClassComponent;
	import model.IClassContent;
	import parsers.components.IComponent;
	import parsers.Parser;
	
	public class ClassContentGeneratorFlashBase extends ClassContentGenerator
	{
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================
		
		public function ClassContentGeneratorFlashBase(targetClass:Object, classPackage:String)
		{
			super(targetClass, classPackage);
		}
		
		override protected function initialize(targetClass:Object, classPackage:String):void 
		{
			_buttons = new Vector.<IClassComponent>();
			_textFields = new Vector.<IClassComponent>();
			
			_classPackage = classPackage;
			_targetClass = targetClass;
			
			var names:Vector.<String> = getComponentsNames(targetClass);
			distributeComponentsNames(names);
			
			_classContent = new ClassContent(classPackage, new SpriteSuperClass());
			
			addComponent(new TemplateComponent(classPackage));
			
			for each (var item:IClassComponent in _textFields)
			{
				addComponent(item);
			}
			
			for each (item in _buttons)
			{
				addComponent(item);
			}
		}
		
	
	}
}