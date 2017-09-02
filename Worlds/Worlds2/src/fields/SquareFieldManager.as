package fields {
	import common.Cell;
	import common.ICell;
	import fields.squares.AbstractSquareField;
	import flash.geom.Point;
	
	public class SquareFieldManager extends BaseFieldManager {
		
		public static const WIDTH:int = 24;
		public static const HEIGHT:int = 24;
		
		public function SquareFieldManager() {
			
		}
		
		override protected function positionFields():void {
			for (var i:int = 0; i < _grid.width; i++) {
				for (var j:int = 0; j < _grid.height; j++) {
					AbstractSquareField(_rectangles[i][j]).initialize(WIDTH, HEIGHT);
					AbstractField(_rectangles[i][j]).x = WIDTH * i;
					AbstractField(_rectangles[i][j]).y = HEIGHT * j;
				}
			}
		}
		
		override public function getPositionByCell(cell:ICell):Point 
		{
			var point:Point;
			point = new Point((cell.x * WIDTH) + WIDTH / 2, (cell.y * HEIGHT) + HEIGHT / 2);
			return point;
		}
		
		override public function getCellByPosition(point:Point):ICell 
		{
			return new Cell(point.x / WIDTH, point.y / HEIGHT);
		}
		
	}

}