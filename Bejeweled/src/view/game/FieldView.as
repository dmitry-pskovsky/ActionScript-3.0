package view.game {
	import events.GameEvent;
	import events.GameRoot;

	import flash.geom.Point;

	import model.GameParameters;

	import model.Gem;

	import starling.display.Image;
	import starling.display.Sprite;

	public class FieldView extends Sprite {
		public static var TILE_WIDTH:int = 80;
		public static var TILE_HEIGHT:int = 80;

		public function FieldView() {
			super();
			draw();
			initializeListeners();
		}
		private var background:Image;

		public function destroy():void {
			GameRoot.removeEventListener(GameEvent.NEW_GEM_CREATED, gemCreatedHandler);
		}

		public function getCoordsOfLocation(location:Point):Point {
			return new Point(location.x * TILE_WIDTH, location.y * TILE_HEIGHT);
		}

		private function initializeListeners():void {
			GameRoot.addEventListener(GameEvent.NEW_GEM_CREATED, gemCreatedHandler);
		}

		private function draw():void {
			for (var i:int = 0; i < GameParameters.FIELD_WIDTH; i++) {
				for (var j:int = 0; j < GameParameters.FIELD_HEIGHT; j++) {
					background = new Image(Assets.getTexture("background"));
					addChild(background);
					background.x = i * TILE_WIDTH;
					background.y = j * TILE_HEIGHT;
				}
			}
		}

		private function gemCreatedHandler(event:GameEvent):void {
			var gemView:GemView = new GemView(Gem(event.data), this);
			addChild(gemView);
		}
	}
}
