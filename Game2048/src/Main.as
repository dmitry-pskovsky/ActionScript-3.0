package {
	import events.GameEvent;
	import events.KeyboardEventListener;

	import flash.display.Sprite;
	import flash.events.Event;

	import model.Grid;

	import view.GridView;

	[SWF(width="512", height="512")]
	public class Main extends Sprite {
		var gridView:GridView;
		var grid:Grid;
		var keyboardListener:KeyboardEventListener;

		public function Main() {
			if (stage)
				initialize();
			else
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
		}

		private function initialize():void {
			gridView = new GridView();
			gridView.x =  (this.stage.stageWidth - gridView.width) / 2;
			gridView.y =  (this.stage.stageHeight - gridView.height) / 2;
			addChild(gridView);

			grid = new Grid();
			keyboardListener = new KeyboardEventListener();
			addChild(keyboardListener);
		}

		private function keyDownClickHandler(event:GameEvent):void {
			trace("hello");
		}
	}
}
