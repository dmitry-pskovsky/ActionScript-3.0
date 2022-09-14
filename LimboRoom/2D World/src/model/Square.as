package model {
	
	public class Square {
		
		private var _x:int;
		private var _y:int;
		private var _f:int;
		private var _g:int;
		private var _h:int;
		private var _parent:Square;
		
		public function Square(x:int, y:int, h:int = 0, g:int = 0) {
			_x = x;
			_y = y;
			_h = h;
			_g = g;
		}
		
		public function initializeParent(parent:Square):void {
			_parent = parent;
			
			if (x != parent.x && y != parent.y)
				_g = parent.g + 14;
			else
				_g = parent.g + 10;
		}
		
		public function initializeH(endSquare:Square):void {
			_h = 10 * (Math.abs(_x - endSquare.x) + Math.abs(_y - endSquare.y));
		}
		
		public function get x():int {
			return _x;
		}
		
		public function get y():int {
			return _y;
		}
		
		public function set y(value:int):void {
			_y = value;
		}
		
		public function get f():int {
			return g + h;
		}
		
		public function get g():int {
			return _g;
		}
		
		public function get h():int {
			return _h;
		}
		
		public function get parent():Square {
			return _parent;
		}
		
	}

}