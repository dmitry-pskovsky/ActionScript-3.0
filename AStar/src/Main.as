package 
{
	import aStar.AStar;
	import aStar.ICell;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		private var _gridManager:GridManager;
		private var _grid:Grid;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_grid = new Grid(20, 20);
			_grid.initialize();
			
			_gridManager = new GridManager(_grid, stage);
			_gridManager.initializeGrid();
			
			//_gridManager.setStateOnPosition(1, 1, Field.STATE_BUSY);
			//_gridManager.setStateOnPosition(0, 0, Field.STATE_BUSY);
			
			_gridManager.setStateOnPosition(3, 0, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(3, 1, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(3, 2, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(3, 3, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(3, 4, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(3, 5, Field.STATE_BUSY);
			
			/*
			_gridManager.setStateOnPosition(0, 3, Field.STATE_BUSY);
			//_gridManager.setStateOnPosition(1, 3, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(2, 3, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(3, 3, Field.STATE_BUSY);
			_gridManager.setStateOnPosition(4, 3, Field.STATE_BUSY);
			*/
			
			/*
			var ast:AStar = new AStar(_grid, _gridManager);
			ast.setPath(new Point(0, 0), new Point(5, 0));
			_gridManager.setStateOnPosition(5, 0, Field.STATE_BUSY);
			*/
			
			var ast:AStar = new AStar(new GridAdapter(_grid));
			
			var way:Vector.<ICell> = ast.setPath(new CellAdapter(new Point(0, 0)), new CellAdapter(new Point(10, 0)));
			
			_gridManager.setStateOnPosition(10, 0, Field.STATE_BUSY);
			for each(var cell:ICell in way)
			{
				_gridManager.setStateOnPosition(cell.x, cell.y, Field.STATE_WAY);
			}
		
		}
		
	}
	
}