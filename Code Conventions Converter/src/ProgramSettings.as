package  
{

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class ProgramSettings 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private static var _mono:Boolean;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function ProgramSettings() 
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

	}
}