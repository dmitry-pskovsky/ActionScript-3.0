package view.characters {
	import events.GameEvent;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class Camera extends Sprite {
		public static const MOUSE_CLICK:String = "MouseClick";

		private var _size:int;

		public function Camera(size:int) {
			super();

			_size = size;
			drawOutline();
			addEventListeners();
		}

		private function addEventListeners():void {
			addEventListener(MouseEvent.CLICK, clickHandler);
		}

		private function clickHandler(event:MouseEvent):void {
			var position:Point = getLocationByMousePosition(new Point(mouseX, mouseY));
			dispatchEvent(new GameEvent(MOUSE_CLICK, position));
		}

		private function getLocationByMousePosition(point:Point):Point {
			return new Point(int(point.x / Constants.SIZE) - int(_size / 2), int(point.y / Constants.SIZE) - int(_size / 2));
		}

		private function drawOutline():void {
			graphics.lineStyle(2, 0xFF0000);
			graphics.beginFill(0x000000, 0.1);
			graphics.drawRect(0, 0, Constants.SIZE * _size, Constants.SIZE * _size);
			graphics.drawRect(Constants.SIZE * 4, Constants.SIZE * 4, Constants.SIZE, Constants.SIZE);

			graphics.endFill();
		}
	}
}
