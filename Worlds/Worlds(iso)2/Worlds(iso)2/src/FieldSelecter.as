package  
{
	import world2D.common.Cell;
	import world2D.fields.AbstractField;
	import world2D.fields.SquareFieldManager;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class FieldSelecter 
	{
		
		private var _squareFieldManager:SquareFieldManager;
		private var _selectedCells:Array;
		
		public function FieldSelecter() 
		{
			
		}
		
		public function initialize(squareFieldManager:SquareFieldManager):void
		{
			_selectedCells = [];
			_squareFieldManager = squareFieldManager;
		}
		
		public function visualizeCell(x:int, y:int):void
		{
			deselectCells();
			_selectedCells.push(new Cell(x, y));
			
			if (_squareFieldManager.getField(x, y) != AbstractField.STATE_BUSY)
				_squareFieldManager.setField(x, y, AbstractField.STATE_WAY);
		}
		
		public function celectCell(x:int, y:int):void
		{
			_squareFieldManager.setField(x, y, AbstractField.STATE_BUSY);
		}
		
		private function deselectCells():void 
		{
			for each (var item:Cell in _selectedCells) 
			{
				if (_squareFieldManager.getField(item.x, item.y) != AbstractField.STATE_BUSY)
					_squareFieldManager.setField(item.x, item.y, AbstractField.STATE_EMPTY);
			}
		}
		
		public function get squareFieldManager():SquareFieldManager 
		{
			return _squareFieldManager;
		}
		
	}

}