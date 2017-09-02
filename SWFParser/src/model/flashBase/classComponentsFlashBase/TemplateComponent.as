package model.flashBase.classComponentsFlashBase {
	import global.Utils;
	import model.IClassComponent;
	import parsers.global.Constants;

	/**
	 * ...
	 * @author 
	 */

	public class TemplateComponent implements IClassComponent 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _path:String;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function TemplateComponent(path:String) 
		{
			_path = path;
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get importText():String 
		{
			return "import " + _path + ";";
		}

		public function get declarationText():String 
		{
			return "private var _template:" + Utils.getClassOriginalNameByPath(_path) + ";";
		}

		public function get initializationText():String 
		{
			return "_template = new " + Utils.getClassOriginalNameByPath(_path) + "();" + Constants.LINE_FOLDING 
			+ "addChild(_template);" + Constants.LINE_FOLDING;
		}

		public function get destroyText():String 
		{
			return "_template = null;";
		}

	}
}