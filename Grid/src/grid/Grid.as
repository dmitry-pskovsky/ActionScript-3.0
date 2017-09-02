package grid {
	import fieldManager.AbstractField;
	
	public class Grid {
		
		private var _grid:Array;
		private var _width:int;
		private var _height:int;
		
		public function Grid() {
			
		}
		
		public function initialize(width:int, height:int):void {
			_grid = [];
			_width = width;
			_height = height;
			
			for (var i:int = 0; i < width; i++) {
				_grid[i] = [];
				for (var j:int = 0; j < height; j++) {
					_grid[i][j] = AbstractField.STATE_EMPTY;
				}
			}
		}
		
		public function setField(x:int, y:int, state:int):void {
			_grid[x][y] = state;
		}
		
		public function getField(x:int, y:int):int {
			if(_grid[x] && _grid[x][y])
				return _grid[x][y];
			else 
				return 0;
		}
		
		public function get width():int {
			return _width;
		}
		
		public function get height():int {
			return _height;
		}
		
	}

}