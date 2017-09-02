package model.flashBase.classComponentsFlashBase {
	import model.superclasses.ISuperClass;

	/**
	 * ...
	 * @author 
	 */

	public class SpriteSuperClass implements ISuperClass 
	{
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function SpriteSuperClass() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get importText():String 
		{
			return "import flash.display.Sprite;";
		}

		public function get extendsText():String 
		{
			return "Sprite";
		}

	}
}