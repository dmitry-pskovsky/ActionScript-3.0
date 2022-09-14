/**
 * Created by dimap on 10/22/2015.
 */
package events {
	import flash.events.Event;

	public class GameEvent extends Event {
		public static const ANIMATION_COMPLETE:String = "AnimationCompletehandler";

		public function GameEvent(type:String, data:Object = null) {
			super(type, false, false);
			_data = data;
		}

		private var _data:Object;

		public function get data():Object {
			return _data;
		}

	}
}
