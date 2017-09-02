package
{
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class BitmapDataGridAdapter implements IGrid
	{
		
		private var _bitmapData:BitmapData;
		
		public function BitmapDataGridAdapter(bitmapData:BitmapData)
		{
			_bitmapData = bitmapData;
		}
		/* INTERFACE IGrid */
		
		public function checkCell(x:int, y:int):Boolean 
		{
			return _bitmapData.getPixel(x, y) == 0;
		}
	
	}

}