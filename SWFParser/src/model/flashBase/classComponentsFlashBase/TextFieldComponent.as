package model.flashBase.classComponentsFlashBase {
	import model.IClassComponent;

	/**
	 * ...
	 * @author 
	 */

	public class TextFieldComponent implements IClassComponent
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _name:String;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function TextFieldComponent(name:String) 
		{
			_name = name;
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get importText():Vector.<String> 
		{
			var imports:Vector.<String> = new Vector.<String>();
			imports.push("import flash.text.TextField;");
			return imports;
		}

		public function get declarationText():String 
		{
			return "private var _" + _name + ":TextField;";
		}

		public function get initializationText():String 
		{
			return "_" + _name + " = " + "_template." + _name + ";";
		}

		public function get destroyText():String 
		{
			return "";
		}

	}
}