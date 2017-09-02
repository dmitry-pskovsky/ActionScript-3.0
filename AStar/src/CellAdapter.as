package  
{
	import aStar.AStar;
	import aStar.ICell;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class CellAdapter implements ICell 
	{
		private var _point:Point;
		
		public function CellAdapter(point:Point) 
		{
			_point = point;
		}
		
		/* INTERFACE ICell */
		
		public function get x():int 
		{
			return _point.x;
		}
		
		public function get y():int 
		{
			return _point.y;
		}
		
	}

}