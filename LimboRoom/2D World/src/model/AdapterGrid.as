package model {
	import view.characters.surface.Surface;

	public class AdapterGrid implements IGrid {
		private var _grid:Vector.<Vector.<int>>;

		public function AdapterGrid(surface:Surface) {
			_grid = surface.grid;
		}

		public function getCell(x:int, y:int):int {
			return _grid[x][y];
		}

		public function setCell(x:int, y:int, state:int):void {

		}

		public function isFreeCell(x:int, y:int):Boolean {
			if (x > _grid.length - 1 || x < 0)
				return false;
			if (y > _grid[0].length - 1 || y < 0)
				return false;
			if (_grid[x][y] == Constants.EMPTY)
				return true;
			else
				return false;
		}

		public function get width():int {
			return _grid.length;
		}

		public function get height():int {
			return _grid[0].length;
		}
	}
}
