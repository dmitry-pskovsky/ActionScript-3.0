package world2D.fields {
	import world2D.common.Cell;
	import world2D.common.ICell;
	import flash.geom.Point;
	import world2D.fields.squares.AbstractSquareField;
	
	public class SquareFieldManager extends BaseFieldManager {
		
		public static const WIDTH:int = 25;
		public static const HEIGHT:int = 25;
		
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