package view {
	import events.GameEvent;
	import events.GameRoot;

	import flash.display.Sprite;
	import flash.geom.Point;

	import model.Slab;

	public class GridView extends Sprite {
		public function GridView() {
			GameRoot.addEventListener(GameEvent.CREATE_SLAB, createSlabHanler);
			draw();
		}

		private function draw():void {
			drawBackground();
			drawEmptyCells();
		}

		private function createSlabHanler(event:GameEvent):void {
			createSlab(Slab(event.data));
		}

		private function drawEmptyCells():void {
			graphics.beginFill(0xCDC1C5);
			for (var i:int = 10; i < 450; i += 110) {
				for (var j:int = 10; j < 450; j += 110) {
					graphics.drawRoundRect(i, j, 100, 100, 10, 10);
				}
			}
		}

		private function drawBackground():void {
			graphics.beginFill(0xC7B696);
			graphics.drawRoundRect(0, 0, 450, 450, 10, 10);
		}

		public function getCoordsOfLocation(location:Point):Point {
			return new Point(10 + location.x * 110, 10 + location.y * 110);
		}

		public function createSlab(slab:Slab):void {
			var slabView:SlabView = new SlabView(this, slab);
			addChild(slabView);
			//slabs.add(slabView);

			//repaint();
		}
	}
}
