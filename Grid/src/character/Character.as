package character {
	import aStar.AStar;
	import common.Cell;
	import common.ICell;
	import flash.display.DisplayObject;
	import fieldManager.AbstractField;
	import fieldManager.BaseFieldManager;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Character implements IDisplayObject {
		
		private var _fieldManager:IFieldManager;
		private var _position:ICell;
		private var _isMoving:Boolean;
		private var _pathToDestination:Vector.<ICell>;
		private var _smothlyMoveManager:SmothlyMoveManager;
		private var _arrow:Arrow;
		private var _clickManager:MouseEventManager;
		
		public function Character(fieldManager:IFieldManager, position:ICell) {
			_fieldManager = fieldManager;
			_arrow = new Arrow();
			_arrow.x = position.x * BaseFieldManager.WIDTH;
			_arrow.y = position.y * BaseFieldManager.HEIGHT;
			this.position = position;
			_pathToDestination = new Vector.<ICell>();
			_isMoving = false;
			
			_smothlyMoveManager = new SmothlyMoveManager();
			
			update();
		}
		
		public function moveTo(destination:ICell):void {
			_isMoving = true;
			
			var _astar:AStar = new AStar(new GridAdapter(_fieldManager));
			_pathToDestination = _astar.setPath(_position, destination);
		}
		
		public function update():void { 
			if (!_isMoving)
				return;
				
			for (var i:int = 0; i < _pathToDestination.length - 1; i++) {
				if (_pathToDestination[i].x == _position.x && _pathToDestination[i].y == _position.y) {
					if (_pathToDestination[i + 1]) {
						position = ICell(_pathToDestination[i + 1]);
						var point:Point = _fieldManager.getPositionByCell(new Cell(_pathToDestination[i + 1].x, _pathToDestination[i + 1].y));
						_smothlyMoveManager.moveTo(_arrow, point, 0.5);
						return;
					} else {
						_isMoving = false;
					}
				}
			}
		}
		
		/* INTERFACE IDisplayObject */
		
		public function get body():DisplayObject {
			return _arrow;
		}
		
		public function set position(value:ICell):void 
		{
			_position = value;
		}
		
		public function set clickManager(value:MouseEventManager):void 
		{
			_clickManager = value;
		}
		
	}

}