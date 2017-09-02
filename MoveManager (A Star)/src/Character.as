package  
{
	import characterMoveManager.aStar.AStar;
	import common.Cell;
	import common.ICell;
	import common.IGrid;
	import fieldManager.BaseFieldManager;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Character extends EventDispatcher implements IDisplayObject
	{
		private var _grid:IGrid;
		private var _position:ICell;
		private var _pathToDestination:Vector.<ICell>;
		private var _arrow:Sprite;
		private var _smothlyMoveManager:SmothlyMoveManager;
		private var _stepsCount:int;
		
		public static const MOVE_COMPLETE:String = "characterMoveComplete";
		
		public function Character(grid:IGrid, position:ICell) 
		{
			_arrow = new Arrow;
			_arrow.x = position.x * BaseFieldManager.WIDTH;
			_arrow.y = position.y * BaseFieldManager.HEIGHT;
			
			_grid = grid;
			
			_position = position;
			
			_pathToDestination = new Vector.<ICell>();
			
			_smothlyMoveManager = new SmothlyMoveManager();
			_smothlyMoveManager.addEventListener(SmothlyMoveManager.MOVE_COMPLETE, onSmothlyMoveManagerComplete);
		}
		
		private function onSmothlyMoveManagerComplete(event:Event):void 
		{
			_position = new Cell(_arrow.x / BaseFieldManager.WIDTH, _arrow.y / BaseFieldManager.HEIGHT);
			doStep();
		}
		
		public function move(destination:ICell):void
		{
			var _astar:AStar = new AStar(_grid);
			_pathToDestination = _astar.setPath(_position, destination);
			
			if(_pathToDestination.length == 1)
				_stepsCount = 0;
			else
				_stepsCount = 1;
				
			doStep();
		}
		
		private function doStep():void 
		{
			if (_pathToDestination.length > _stepsCount)
				moveTo(_pathToDestination[_stepsCount++]);
			else
				dispatchEvent(new Event(MOVE_COMPLETE));
		}
		
		private function moveTo(cell:ICell):void 
		{
			var point:Point = BaseFieldManager.getPositionByCell(cell);
			_smothlyMoveManager.moveTo(_arrow, point, 0.5);
		}
		
		/* INTERFACE IDisplayObject */
		
		public function get body():DisplayObject 
		{
			return _arrow;
		}
		
	}

}