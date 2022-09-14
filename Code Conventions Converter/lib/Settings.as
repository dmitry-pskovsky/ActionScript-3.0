package  {

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class Settings 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private static var _mono:Boolean;
		private static var _conventionStyle:Object;
		
		public static const SETTINGS_FILE:String = "appearance.json";
		public static const STRUCTURE_FILE:String = "structure.json";

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Settings() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function get mono():Boolean 
		{
			return _mono;
		}

		public static function set mono(value:Boolean):void 
		{
			_mono = value;
		}
		
		static public function get conventionStyle():Object 
		{
			return _conventionStyle;
		}
		
		static public function set conventionStyle(value:Object):void 
		{
			_conventionStyle = value;
		}
	}
}