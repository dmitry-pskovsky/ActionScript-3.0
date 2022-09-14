package  
{
	import flash.filesystem.File;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class Temp 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private static var _file:File

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Temp() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function get file():File 
		{
			return _file;
		}

		public static function set file(value:File):void 
		{
			_file = value;
		}

		public static function get directory():String
		{
			return _file.parent.nativePath;
		}

		public static function get name():String
		{
			var str:String = _file.nativePath.slice(0, _file.nativePath.lastIndexOf("."));
			return str.slice(_file.nativePath.lastIndexOf("\\") + 1);
		}

	}
}