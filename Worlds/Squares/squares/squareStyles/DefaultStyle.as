package squareStyles 
{
	import squares.squareStyles.SquareStyle;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class DefaultStyle extends SquareStyle 
	{
		
		public function DefaultStyle() 
		{
			super();
		}
		
		override protected function initialize():void 
		{
			_thikness = 1;
			_fillColor = 0x8B8B8B;
			_lineColor = 0x1E1E1E;
		}
		
	}

}