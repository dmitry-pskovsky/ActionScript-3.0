package fields {
	import common.Cell;
	import flash.geom.Point;
	import common.HXMath;
	import common.ICell;
	import fields.hexagons.AbstractHexagonField;
	
	public class HexagonFieldManager extends BaseFieldManager {
		
		public static var RADIUS:int = 10;
		public static var N:Number = Math.sin(HXMath.getRadians(90)) * RADIUS - Math.sin(HXMath.getRadians(60)) * RADIUS;
		public static var M:Number = Math.cos(HXMath.getRadians(0)) * RADIUS - Math.cos(HXMath.getRadians(60)) * RADIUS;
		
		public function HexagonFieldManager() {
			super();
		}
		
		override protected function positionFields():void {
			
			for (var i:int = 0; i < _grid.width; i++) {
				for (var j:int = 0; j < _grid.height; j++) {
					AbstractHexagonField(_rectangles[i][j]).initialize(RADIUS);
	
					if (j % 2 == 0)
						AbstractField(_rectangles[i][j]).x = i * (RADIUS - N) * 2; 
					else
						AbstractField(_rectangles[i][j]).x = i * (RADIUS - N) * 2 + AbstractField(_rectangles[i][j]).width / 2; 
						
					AbstractField(_rectangles[i][j]).y = j * ((RADIUS * 2) - M);
	
				}
			}
		}
		
		override public function getCellByPosition(point:Point):ICell 
		{
			var cell:Cell;
			
			var point:Point = new Point(point.x - x, point.y - y);

			for (var i:int = 0; i < _rectangles.length; i++) 
			{
				for (var j:int = 0; j < _rectangles[i].length; j++) 
				{
					if (getDistance(point, new Point(AbstractField(_rectangles[i][j]).x, AbstractField(_rectangles[i][j]).y)) < RADIUS - 1)
						return new Cell(i, j);
				}
			}

			return null;
		}
		
		private function getDistance(point1:Point, point2:Point):Number
		{
			var point:Point = new Point(point2.x - point1.x, point2.y - point1.y);

			return point.length;
		}
		
		override public function getPositionByCell(cell:ICell):Point 
		{
			if (_rectangles[cell.x] && _rectangles[cell.x][cell.y])
				return new Point(_rectangles[cell.x][cell.y].x + x, _rectangles[cell.x][cell.y].y + y);
				
			return null;
		}
	}

}