package characterMoveManager.adapters 
{
	import common.IGrid;
	import fieldManager.AbstractField;
	import grid.Grid;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class GridAdapter implements IGrid 
	{
		private var _grid:Grid;
		
		public function GridAdapter(_grid:Grid) 
		{
			this._grid = _grid;
		}
		
		/* INTERFACE common.IGrid */
		
		public function getCell(x:int, y:int):int 
		{
			return _grid.getField(x, y);
		}
		
		public function setCell(x:int, y:int, state:int):void 
		{
			_grid.setField(x, y, state);
		}
		
		public function checkFreeCell(x:int, y:int):Boolean 
		{
			return _grid.getField(x, y) == AbstractField.STATE_EMPTY;
		}
		
		public function get width():int 
		{
			return _grid.width;
		}
		
		public function get height():int 
		{
			return _grid.height;
		}
		
	}

}