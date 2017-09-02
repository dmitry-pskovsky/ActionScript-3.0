package events  {
	import flash.events.Event;
	
	
	public class GameEvent extends Event {
		
		public static const CELL_CLICK:String = "cellClick";
		public static const CELL_MOUSE_DOWN:String = "mouseDown";
		public static const CELL_MOUSE_UP:String = "mouseUp";
		
		private var _data:*;
		
		public function GameEvent(type:String, data:*, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_data = data;
		}
		
		public function get data():* {
			return _data;
		}
		
	}

}