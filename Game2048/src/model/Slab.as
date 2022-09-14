/**
 * Created by dimap on 10/22/2015.
 */
package model {
	import events.GameEvent;
	import events.GameRoot;

	import flash.events.EventDispatcher;
	import flash.geom.Point;

	public class Slab extends EventDispatcher {
		private var _location:Point;
		private var grid:Grid;
		private var _value:int;

		public function Slab(grid:Grid, location:Point) {
			this.location = location;
			this.value = 2;
			this.grid = grid;
		}

		public function up():void {
			value *= 2;
			dispatchEvent(new GameEvent(GameEvent.UP_LEVEL_SLAB));
		}

		public function getValue():int {
			return value;
		}

		private function moveToLocation(location:Point):void {
			grid.removeSlab(this.location);
			this.location = location;
			grid.addSlab(this, location);

			dispatchEvent(new GameEvent(GameEvent.MOVE_TO_LOCATION, location));
		}

		public function keyDownPressed():void {
			var y:int = location.y;
			while (grid.isLocationEmpty(new Point(location.x, y + 1), value)) {
				y++;
			}
			if(location.y != y)
				moveToLocation(new Point(location.x, y));
		}

		public function keyUpPressed():void {
			var y:int = location.y;
			while (grid.isLocationEmpty(new Point(location.x, y - 1), value)) {
				y--;
			}
			if(location.y != y)
				moveToLocation(new Point(location.x, y));
		}

		public function remove():void {
			dispatchEvent(new GameEvent(GameEvent.REMOVE_SLAB));
		}


		public function keyRightPressed():void {
			var x:int = location.x;
			while (grid.isLocationEmpty(new Point(x + 1, location.y), value)) {
				x++;
			}
			if(location.x != x)
				moveToLocation(new Point(x, location.y));
		}

		public function keyLeftPressed():void {
			var x:int = location.x;
			while (grid.isLocationEmpty(new Point(x - 1, location.y), value)) {
				x--;
			}
			if(location.x != x)
				moveToLocation(new Point(x, location.y));
		}

		public function get value():int {
			return _value;
		}

		public function set value(value:int):void {
			_value = value;
		}

		public function get location():Point {
			return _location;
		}

		public function set location(value:Point):void {
			_location = value;
		}
	}
}
