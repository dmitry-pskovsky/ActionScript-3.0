package fields {
	import common.ICell;
	import common.IGrid;
	import fields.visualize.GreyVisualizeType;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	
	public class BaseFieldManager extends Sprite {
		
		protected var _grid:IGrid;
		protected var _rectangles:Array;
		
		public function BaseFieldManager() {
			
		}
		
		public function initialize(grid:IGrid, fieldSkin:Class):void {
			_grid = grid;
			
			var abstractField:Object;
			_rectangles = [];
			
			for (var i:int = 0; i < _grid.width; i++) {
				_rectangles[i] = [];
				for (var j:int = 0; j < _grid.height; j++) {
					abstractField = new fieldSkin();
					AbstractField(abstractField).initializeVisualizeType(new GreyVisualizeType());
					abstractField.setState(_grid.getCell(i, j));
					_rectangles[i][j] = abstractField;
					addChild(DisplayObject(abstractField));
				}
			}
			
			positionFields();
		}
		
		public function setField(x:int, y:int, state:int):void {
			if (_rectangles[x] && _rectangles[x][y]) {
				_rectangles[x][y].setState(state);
				_grid.setCell(x, y, state);
			}
		}
		
		public function vizualizeField(x:int, y:int, state:int):void {
			if (_rectangles[x] && _rectangles[x][y])
				_rectangles[x][y].setState(state);
		}
		
		public function getPositionByCell(cell:ICell):Point
		{
			return null;
		}
		
		public function getCellByPosition(point:Point):ICell
		{
			return null;
		}
		
		protected function positionFields():void {
			
		}
		
	}

}