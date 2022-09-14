package view.characters.surface {
	import flash.display.Shape;
	import flash.geom.Point;

	public class SurfaceSquare extends Shape {
		private var _location:Point;
		private var _type:int;

		public function SurfaceSquare(location:Point, type:int) {
			super();

			_location = location;
			_type = type;
			initialize();
		}

		private function initialize():void {
			switch (_type) {
				case Constants.EMPTY:
					graphics.beginFill(0xAEFFA8, 0.4);
					graphics.lineStyle(1, 0x0DAA00, 0.4);
					break;
				case Constants.BUSY:
					graphics.beginFill(0xFFA8A8);
					graphics.lineStyle(1, 0xAA0000);
					break;
				default:
					trace("None of the above were met");
			}
			graphics.drawRect(_location.x * Constants.SIZE + 1, _location.y * Constants.SIZE + 1, Constants.SIZE - 2, Constants.SIZE - 2);
		}
	}
}
