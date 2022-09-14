package model {
	import events.GameEvent;
	import events.GameRoot;

	public class GameParameters {
		private static var _points:int = 0;

		public static const MOBILE:String = "Mobile";
		public static const DESKTOP:String = "Desktop";

		public static var FIELD_WIDTH:int = 8;
		public static var FIELD_HEIGHT:int = 8;
		public static var GAME_TYPE:String;

		public static function get points():int {
			return _points;
		}

		public static function set points(value:int):void {
			_points = value;
			GameRoot.dispatchEvent(new GameEvent(GameEvent.UPDATE_SCORE));
		}

		public function GameParameters() {

		}
	}
}
