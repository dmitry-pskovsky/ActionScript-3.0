package fieldManager {
	import character.IFieldManager;
	import common.Cell;
	import common.ICell;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import grid.Grid;
	
	
	public class BaseFieldManager extends Sprite implements IFieldManager {
		
		private var _grid:Grid;
		private var _rectangles:Array;
		
		private var _previousCellEditionMode:ICell;
		
		private static var fieldManagerInstance:BaseFieldManager;
		
		public static const WIDTH:int = 30;
		public static const HEIGHT:int = 30;
		
		public function BaseFieldManager(fieldSkin:Class, grid:Grid) {
			_grid = grid;
			
			BaseFieldManager.fieldManagerInstance = this;
			
			var abstractField:AbstractField;
			_rectangles = [];
			for (var i:int = 0; i < _grid.width; i++) {
				_rectangles[i] = new Vector.<AbstractField>();
				for (var j:int = 0; j < _grid.height; j++) {
					abstractField = new fieldSkin() as AbstractField;
					abstractField.initialize(WIDTH, HEIGHT);
					abstractField.setState(_grid.getField(i, j));
					abstractField.x = WIDTH * i;
					abstractField.y = HEIGHT * j;
					
					_rectangles[i][j] = abstractField;
					addChild(abstractField);
				}
			}
		}
		
		/* INTERFACE character.IFieldManager */
		
		public function setField(x:int, y:int, state:int):void {
			if (_rectangles[x] && _rectangles[x][y]) {
				_rectangles[x][y].setState(state);
				_grid.setField(x, y, state);
			}
		}
		
		public function getField(x:int, y:int):int {
			return _grid.getField(x, y);
		}
		
		public function getCellByPosition(x:int, y:int):ICell {
			return new Cell(x / WIDTH, y / HEIGHT);
		}
		
		public function getPositionByCell(cell:ICell):Point {
			var point:Point;
			point = new Point((cell.x * WIDTH) + WIDTH / 2, (cell.y * HEIGHT) + HEIGHT / 2);
			return point;
		}
		
		public function set editingMode(value:Boolean):void {
			if (value)
			{
				_previousCellEditionMode = null;
				addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			}
			else
			{
				_previousCellEditionMode = null;
				removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			}
		}
		
		/* INTERFACE IDisplayObject */
		
		public function get body():DisplayObject 
		{
			return this;
		}
		
		private function getAbstractField(x:int, y:int):AbstractField {
			if (_rectangles[x] && _rectangles[x][y])
				return _rectangles[x][y];
			else 
				return null;
		}
		
		private function onMouseMoveHandler(event:MouseEvent):void 
		{
			var cell:ICell = getCellByPosition(mouseX, mouseY);
			
			if (_previousCellEditionMode)
				setField(_previousCellEditionMode.x, _previousCellEditionMode.y, AbstractField.STATE_EMPTY);	
			else
				setField(cell.x, cell.y, AbstractField.STATE_EMPTY);
			
			var field:AbstractField = getAbstractField(cell.x, cell.y);
			if (field && field.state == AbstractField.STATE_EMPTY)
			{
				setField(cell.x, cell.y, AbstractField.STATE_BUSY);
				_previousCellEditionMode = cell;
			}
		}
		
		public static function getPositionByCell(cell:ICell):Point
		{
			return fieldManagerInstance.getPositionByCell(cell);
		}
		
	}

}