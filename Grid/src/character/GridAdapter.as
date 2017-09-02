package character
{
	import common.IGrid;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class GridAdapter implements IGrid {
		private var _fieldManager:IFieldManager;
		
		public function GridAdapter(fieldManager:IFieldManager) {
			_fieldManager = fieldManager;
		}
		
		public function getCell(x:int, y:int):int {
			return _fieldManager.getField(x, y);
		}
		
		public function setCell(x:int, y:int, state:int):void {
			_fieldManager.setField(x, y, state);
		}

		public function checkFreeCell(x:int, y:int):Boolean 
		{
			return true;
		}
		
		public function get width():int 
		{
			return 0;
		}
		
		public function get height():int 
		{
			return 0;
		}
	}

}