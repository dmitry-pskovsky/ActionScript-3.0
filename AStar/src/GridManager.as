package  
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class GridManager 
	{
		
		public function GridManager(grid:Grid, stage:DisplayObjectContainer) 
		{
			_grid = grid;
			_stage = stage;
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		public function initializeGrid():void
		{
			_fields = [];
			
			if (_grid)
			{
				for (var i:int = 0; i < _grid.width; i++) 
				{
					_fields[i] = [];
					
					for (var j:int = 0; j < _grid.height; j++) 
					{
						_fields[i][j] = new Field(Field.STATE_EMPTY);
						_fields[i][j].x = i * Field.SIZE;
						_fields[i][j].y = j * Field.SIZE;
						_stage.addChild(_fields[i][j]);
					}
				}
			}
		}
		
		public function setStateOnPosition(x:int, y:int, state:int):void
		{
			_grid.setStateOnPosition(x, y, state);
			Field(_fields[x][y]).setState(state);
		}
		
		public function get grid():Grid 
		{
			return _grid;
		}
		
		public function get fields():Array 
		{
			return _fields;
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		
		private var _grid:Grid;
		private var _fields:Array;
		private var _stage:DisplayObjectContainer;
		
	}

}