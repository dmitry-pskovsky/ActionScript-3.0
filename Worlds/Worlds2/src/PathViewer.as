package  
{
	import aStar.BaseAStar;
	import aStar.SquareAStar;
	import common.Cell;
	import common.ICell;
	import common.IGrid;
	import fields.AbstractField;
	import fields.BaseFieldManager;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class PathViewer 
	{
		private var _baseFieldManager:BaseFieldManager;
		private var _visualizedCells:Vector.<ICell>;
		
		public function PathViewer() 
		{
			
		}
		
		public function initialize(baseFieldManager:BaseFieldManager):void
		{
			_baseFieldManager = baseFieldManager;
			_visualizedCells = new Vector.<ICell>();
		}
		
		public function visualizeWay(way:Vector.<ICell>):void
		{
			for each (var cell:ICell in way) 
			{
				_baseFieldManager.vizualizeField(cell.x, cell.y, AbstractField.STATE_WAY);
				_visualizedCells.push(cell);
			}
		}
		
		public function visualizeCell(cell:ICell):void
		{
			_baseFieldManager.vizualizeField(cell.x, cell.y, AbstractField.STATE_WAY);
			_visualizedCells.push(cell);
		}
		
		public function clear():void
		{
			for each (var cell:ICell in _visualizedCells)
			{
				_baseFieldManager.vizualizeField(cell.x, cell.y, AbstractField.STATE_EMPTY);
			}
		}
		
	}

}