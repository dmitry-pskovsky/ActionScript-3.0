package  {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class GameStream {
		
		private static var eventDispatcher:EventDispatcher = new EventDispatcher();
		
		public function GameStream() {
			
		}
		
		public static function dispatchEvent(event:Event):Boolean {
			return eventDispatcher.dispatchEvent(event);
		}
		
		public static function addEventListener(type:String, listener:Function):void {
			eventDispatcher.addEventListener(type, listener, false, 0, true);
		}
		
	}

}