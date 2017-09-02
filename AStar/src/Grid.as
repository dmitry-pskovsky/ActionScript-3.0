package  
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Grid 
	{
		
		public function Grid(width:int, height:int) 
		{
			_width = width;
			_height = height;
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		public function initialize():void
		{
			_grid = [];
			for (var i:int = 0; i < _width; i++) 
			{
				_grid[i] = [];
				for (var j:int = 0; j < _height; j++) 
				{
					_grid[i][j] = Field.STATE_EMPTY;
				}
			}
		}
		
		public function getField(x:int, y:int):int
		{
			if (_grid[x] && _grid[x][y])
				return _grid[x][y];
			else
				return 0;
		}
		
		public function setStateOnPosition(x:int, y:int, state:int):void
		{
			_grid[x][y] = state;
		}
		
		public function get width():int 
		{
			return _width;
		}
		
		public function get height():int 
		{
			return _height;
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		
		private var _width:int;
		private var _height:int;
		private var _grid:Array;
		
	}

}