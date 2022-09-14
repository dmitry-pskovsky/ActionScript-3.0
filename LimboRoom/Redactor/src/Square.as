package {

	import flash.display.Sprite;
	import flash.geom.Point;

	public class Square extends Sprite {
		private var _location:Point;
		private var _status:int;
		private var _surface:Surface;

		public function Square(location:Point, status:int, surface:Surface) {
			_location = location;
			_status = status;
			_surface = surface;
			setOnPosition();
			draw();
		}

		private function setOnPosition():void {
			x = _location.x * Constants.SIZE;
			y = _location.y * Constants.SIZE;
		}

		private function draw():void {
			var color:uint;

			switch (_status) {
				case Constants.EMPTY:
					graphics.beginFill(0xAEFFA8);
					graphics.lineStyle(1, 0x0DAA00);
					break;
				case Constants.BUSY:
					graphics.beginFill(0xFFA8A8);
					graphics.lineStyle(1, 0xAA0000);
					break;
				default:
					trace("None of the above were met");
			}
			graphics.drawRect(1, 1, Constants.SIZE - 2, Constants.SIZE - 2);
			graphics.endFill();
		}
	}
}
