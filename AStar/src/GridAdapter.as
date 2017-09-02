package  
{
	import aStar.IGrid;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class GridAdapter implements IGrid
	{
		private var _grid:Grid;
		
		public function GridAdapter(grid:Grid) 
		{
			_grid = grid;
		}
		
		public function getCell(x:int, y:int):int {
			return _grid.getField(x, y);
		}
		
		public function setCell(x:int, y:int, state:int):void {
			_grid.setStateOnPosition(x, y, state);
		}
		
	}

}