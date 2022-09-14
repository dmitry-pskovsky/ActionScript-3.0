package model {
	import events.GameEvent;
	import events.GameRoot;

	import flash.events.EventDispatcher;
	import flash.geom.Point;

	public class Gem extends EventDispatcher {
		public static const OVAL_TYPE:int = 1;
		public static const SQUARE_TYPE:int = 2;
		public static const HEXAGON_TYPE:int = 3;
		public static const RHOMB_TYPE:int = 4;
		public static const TRIANGLE_TYPE:int = 5;

		public function Gem(type:int, location:Point) {
			_type = type;
			_location = location;
			initialize();
		}

		private var _type:int;

		public function get type():int {
			return _type;
		}

		public function set type(value:int):void {
			_type = value;
		}

		private var _location:Point;

		public function get location():Point {
			return _location;
		}

		private var _selected:Boolean = false;

		public function get selected():Boolean {
			return _selected;
		}

		public function set selected(value:Boolean):void {
			dispatchEvent(new GameEvent(GameEvent.GEM_SELECTION_CHANGE, value));
			_selected = value;
		}

		public function destroy():void {
			dispatchEvent(new GameEvent(GameEvent.GEM_DELETED));
			GameParameters.points++;
		}

		public function moveToLocation(location:Point, immediately:Boolean):void {
			_location = location;
			dispatchEvent(new GameEvent(GameEvent.GEM_POSITION_CHANGE, immediately));
		}

		public function setSelected():void {
			selected = true;
			GameRoot.dispatchEvent(new GameEvent(GameEvent.GEM_ON_LOCATION_SELECTED, location));
		}

		private function initialize():void {
			GameRoot.dispatchEvent(new GameEvent(GameEvent.NEW_GEM_CREATED, this));
		}
	}
}
