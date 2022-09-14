package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class Surface extends Sprite {
		private var _map:Vector.<Vector.<int>>;;

		public function Surface(map:Vector.<Vector.<int>>) {
			_map = map;
			initialize();
		}

		private function initialize():void {
			draw();
			addEventListeners();
		}

		private function addEventListeners():void {
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}

		private function mouseMoveHandler(event:MouseEvent):void {
			if(x > 10)
				x = 10;

			if(y > 10)
				y = 10;

			if(x < stage.stageWidth - width)
				x = stage.stageWidth - width;

			if(y < stage.stageHeight - height)
				y = stage.stageHeight - height;
		}

		private function mouseUpHandler(event:MouseEvent):void {
			stopDrag()
		}

		private function mouseDownHandler(event:MouseEvent):void {
			startDrag();
		}

		private function draw():void {
			for (var i:int = 0; i < _map.length; i++) {
				for (var j:int = 0; j < _map[i].length; j++) {
					addChild(new Square(new Point(i, j), _map[i][j], this));
				}
			}

			graphics.beginFill(0xCCCC);
			graphics.drawRect(0, 0, Constants.SIZE * _map.length + 2, Constants.SIZE * _map.length + 2);
			graphics.endFill();
		}
	}
}
