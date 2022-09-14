package parsers.components 
{

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class FunctionCC implements IComponent
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _content:Array;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function FunctionCC(content:Array) 
		{
			_content = content;
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function text():String 
		{
			var string:String = "";
			
			for each (var item:String in _content) 
			{
				string += item;
			}
			
			return string + "\n";
		}

	}
}