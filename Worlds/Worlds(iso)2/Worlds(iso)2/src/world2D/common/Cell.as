package world2D.common {
	
	
	public class Cell implements ICell {
		
		private var _x:int;
		private var _y:int;
		
		public function Cell(x:int, y:int) {
			_x = x;
			_y = y;
		}
		
		/* INTERFACE aStar.ICell */
		
		public function get x():int {
			return _x;
		}
		
		public function get y():int {
			return _y;
		}
		
	}

}