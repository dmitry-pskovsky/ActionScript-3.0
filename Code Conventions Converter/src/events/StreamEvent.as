package events 
{
	import flash.events.Event;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class StreamEvent extends Event 
	{
		//=========================================================================
		// CONSTANTS
		//=========================================================================

		public static const LOAD_FILE:String = "loadFile";
		public static const SAVE_FILE:String = "saveFile";
		public static const LOAD_FILE_COMPLETE:String = "loadFileComplete";

		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _data:Object; 

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function StreamEvent(type:String, data:Object = null) 
		{
			_data = data;
			super(type);
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get data():Object 
		{
			return _data;
		}

	}
}