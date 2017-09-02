package squares.squareStyles 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SquareStyle 
	{
		protected var _thikness:Number;
		protected var _fillColor:uint;
		protected var _filAlpha:Number = 1;
		protected var _lineColor:uint;
		protected var _lineAlpha:Number = 1;
		
		public function SquareStyle() 
		{
			initialize();
		}
		
		protected function initialize():void 
		{
			
		}
		
		public function get thikness():Number 
		{
			return _thikness;
		}
		
		public function get fillColor():uint 
		{
			return _fillColor;
		}
		
		public function get lineColor():uint 
		{
			return _lineColor;
		}
		
		public function get lineAlpha():Number 
		{
			return _lineAlpha;
		}
		
		public function get filAlpha():Number 
		{
			return _filAlpha;
		}
		
	}

}