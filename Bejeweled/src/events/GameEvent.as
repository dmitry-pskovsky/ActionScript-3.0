/**
 * Created by dimap on 10/22/2015.
 */
package events {
	import flash.events.Event;

	public class GameEvent extends Event {
		public static const NEW_GEM_CREATED:String = "NewGemCreated";
		public static const GEM_POSITION_CHANGE:String = "GemPositionChange";
		public static const GEM_SELECTION_CHANGE:String = "GemSelectionChange";
		public static const GEM_DELETED:String = "GemDeleted";
		public static const GEM_ON_LOCATION_SELECTED:String = "GemOnLocationSelected";

		public static const UPDATE_SCORE:String = "UpdateScore";

		public static const ANIMATION_COMPLETE:String = "AnimationComplete";

		public static const SCREEN_CHANGE:String = "ScreenChange";

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
