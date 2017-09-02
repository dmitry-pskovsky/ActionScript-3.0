package model.feathers {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import model.ClassContentGenerator;
	import model.classContents.ClassContent;
	import model.feathers.classComponentsFeathers.ButtonFeathersComponent;
	import model.feathers.classComponentsFeathers.LabelComponent;
	import model.feathers.classComponentsFeathers.TexturizedSpriteSuperClass;
	import model.flashBase.classComponentsFlashBase.ButtonSkinComponent;
	import model.flashBase.classComponentsFlashBase.TemplateComponent;
	import model.IClassComponent;
	import parsers.components.IComponent;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class ClassContentGenetratorFeathers extends ClassContentGenerator
	{
		
		public function ClassContentGenetratorFeathers(targetClass:Object, classPackage:String) 
		{
			super(targetClass, classPackage);
		}
		
		override protected function initialize(targetClass:Object, classPackage:String):void 
		{
			_buttons = new Vector.<IClassComponent>();
			_textFields = new Vector.<IClassComponent>();
			
			_classPackage = classPackage;
			_targetClass = targetClass;
			
			var names:Vector.<Object> = getComponents(targetClass);
			distributeComponents(names);
			
			_classContent = new ClassContent(classPackage, new TexturizedSpriteSuperClass());
			
			for each (var item:IClassComponent in _textFields)
			{
				addComponent(item);
			}
			
			for each (item in _buttons)
			{
				addComponent(item);
			}
		}
		
		private function getComponents(targetClass:Object):Vector.<Object>
		{
			var componentsNames:Vector.<Object> = new Vector.<Object>();
			var myObject:DisplayObjectContainer = DisplayObjectContainer(targetClass);
			
			for (var i:int = 0; i < myObject.numChildren; i++)
			{
				componentsNames.push(myObject.getChildAt(i));
			}
			
			return componentsNames;
		}
		
		protected function distributeComponents(components:Vector.<Object>):void 
		{
			for each (var component:DisplayObject in components)
			{
				if (component.name.search("TextField") != -1)
					_textFields.push(new LabelComponent(component.name, component))
				//else if (component.name.search("Button") != -1)
					//_buttons.push(new ButtonFeathersComponent(component.name, component))
				else
					continue;
			}
			
		}
		
	}

}