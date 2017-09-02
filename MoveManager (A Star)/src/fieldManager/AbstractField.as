package fieldManager {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class AbstractField extends AbstractFieldEventDispatcher {
		
		public static const STATE_EMPTY:int = 1;
		public static const STATE_WAY:int = 2;
		public static const STATE_BUSY:int = 3;
		
		private var _state:int;
		
		public function AbstractField() {
			
		}
		
		public function initialize(width:int, height:int):void {
			
		}
		
		public function setState(state:int):void {
			_state = state;
		}
		
		public function get state():int 
		{
			return _state;
		}
		
	}

}