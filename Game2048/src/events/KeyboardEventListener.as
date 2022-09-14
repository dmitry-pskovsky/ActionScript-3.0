/**
 * Created by dimap on 10/22/2015.
 */
package events {
	import events.GameEvent;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class KeyboardEventListener extends Sprite {
		public function KeyboardEventListener() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
		}

		private function initialize(event:Event):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}

		private function keyDownHandler(event:KeyboardEvent):void {
			switch (event.keyCode){
				case Keyboard.DOWN:
					GameRoot.dispatchEvent(new GameEvent(GameEvent.KEY_DOWN_PRESSED));
					break;
				case Keyboard.UP:
					GameRoot.dispatchEvent(new GameEvent(GameEvent.KEY_UP_PRESSED));
					break;
				case Keyboard.RIGHT:
					GameRoot.dispatchEvent(new GameEvent(GameEvent.KEY_RIGHT_PRESSED));
					break;
				case Keyboard.LEFT:
					GameRoot.dispatchEvent(new GameEvent(GameEvent.KEY_LEFT_PRESSED));
					break;
				default:
					break;
			}
		}
	}
}

