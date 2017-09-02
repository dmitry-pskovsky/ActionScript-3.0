package world3D.directional.gui.window.events {
	import flash.events.Event;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class WindowEvent extends Event {
		
		public static const CHANGE_CONTENT_SIZE:String = 'ChangeContentSize';
		
		private var _data:Object;
		
		public function WindowEvent(type:String, data:Object) { 
			super(type, false, false);	
			_data = data;
		} 
		
		public function get data():Object {
			return _data;
		}
		
	}
	
}