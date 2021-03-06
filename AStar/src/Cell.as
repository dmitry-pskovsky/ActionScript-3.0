package  
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Cell implements ICell 
	{
		private var _x:int;
		private var _y:int;
		
		public function Cell(x:int, y:int) 
		{
			_x = x;
			_y = y;
		}
		
		/* INTERFACE ICell */
		
		public function get x():int 
		{
			return _x;
		}
		
		public function get y():int 
		{
			return _y;
		}
		
	}

}