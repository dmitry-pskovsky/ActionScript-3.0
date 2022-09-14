/**
 * Created by dimap on 10/22/2015.
 */
package events {
	import flash.events.Event;

	public class GameEvent extends Event {

		public static const KEY_DOWN_PRESSED:String = "KeyDownPressed";
		public static const KEY_UP_PRESSED:String = "KeyUpPressed";
		public static const KEY_RIGHT_PRESSED:String = "KeyDRightPressed";
		public static const KEY_LEFT_PRESSED:String = "KeyLeftPressed";
		public static const CREATE_SLAB:String = "CreateSlab";
		public static const REMOVE_SLAB:String = "RemoveSlab";
		public static const UP_LEVEL_SLAB:String = "UpLevelSlab";

		public static const MOVE_TO_LOCATION:String = "MoveToLocation";

		private var _data:Object;

		public function GameEvent(type:String, data:Object = null) {
			super(type, false, false);
			_data = data;
		}

		public function get data():Object {
			return _data;
		}

	}
}
