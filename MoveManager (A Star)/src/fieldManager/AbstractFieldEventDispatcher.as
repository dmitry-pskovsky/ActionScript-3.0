package fieldManager {
	//import events.GameEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class AbstractFieldEventDispatcher extends Sprite {
		
		public function AbstractFieldEventDispatcher() {
			addEventListener(MouseEvent.CLICK, clickHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, downHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_UP, upHandler, false, 0, true);
		}
		
		private function upHandler(event:MouseEvent):void 
		{
			//GameStream.dispatchEvent(new GameEvent(GameEvent.CELL_MOUSE_UP, this));
		}
		
		private function downHandler(event:MouseEvent):void 
		{
			//GameStream.dispatchEvent(new GameEvent(GameEvent.CELL_MOUSE_DOWN, this));
		}
		
		private function clickHandler(e:MouseEvent):void {
			//GameStream.dispatchEvent(new GameEvent(GameEvent.CELL_CLICK, this));
		}
		
	}

}