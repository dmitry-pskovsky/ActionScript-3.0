package model.feathers.classComponentsFeathers {
	import model.IClassComponent;
	
	/**
	 * ...
	 * @author 
	 */
	public class ButtonFeathersComponent implements IClassComponent 
	{
		private var _name:String;
		private var _component:Object;
		
		public function ButtonFeathersComponent(name:String, component:Object) 
		{
			_name = name;
		}
		
		/* INTERFACE model.IClassComponent */
		
		public function get importText():String 
		{
			return "import ButtonSkin;";
		}
		
		public function get declarationText():String 
		{
			return "private var _" + _name + ":ButtonSkin;";
		}
		
		public function get initializationText():String 
		{
			return "_" + _name + " = " + "new ButtonSkin(_template." + _name + ", '"+ _name +"');";
		}
		
		public function get destroyText():String 
		{
			return "_" + _name + ".destroy();";
		}
		
	}

}