package model.feathers.classComponentsFeathers {
	import model.superclasses.ISuperClass;

	/**
	 * ...
	 * @author 
	 */

	public class TexturizedSpriteSuperClass implements ISuperClass 
	{
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function TexturizedSpriteSuperClass() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get importText():String 
		{
			return "import gui.iphone.feathers.texturizedObjects.TexturizedSprite;";
		}

		public function get extendsText():String 
		{
			return "TexturizedSprite";
		}

	}
}