package  
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class IdealNumber 
	{
		private static var _number:int;
		
		public function IdealNumber() 
		{
			
		}
		
		static public function get number():int 
		{
			return _number;
		}
		
		static public function set number(value:int):void 
		{
			_number = value;
		}
		
	}

}