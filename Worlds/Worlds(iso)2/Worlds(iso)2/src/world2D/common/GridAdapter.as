package world2D.common 
{
	import grid.Grid;
	import world2D.fields.AbstractField;
	
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
		
		/* INTERFACE world2D.world2D.common.IGrid */
		
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
			if (_grid.getField(x, y) != 0 && _grid.getField(x, y) == AbstractField.STATE_EMPTY)
				return true;
			else
				return false;
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