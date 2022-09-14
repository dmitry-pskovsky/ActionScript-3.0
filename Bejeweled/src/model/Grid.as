package model {
	import flash.geom.Point;

	public class Grid {

		private var _items:Array;
		private var _sizeX:int;
		private var _sizeY:int;

		public function Grid(sizeX:int, sizeY:int) {
			_sizeX = sizeX;
			_sizeY = sizeY;
		}

		public function initialize():void {
			_items = new Array();
			for (var i:int = 0; i < _sizeX; i++) {
				_items[i] = new Array();
				for (var j:int = 0; j < _sizeY; j++) {
					_items[i][j] = null;
				}
			}
		}

		public function getItemOnLocation(location:Point):Gem {
			if (_items[location.x] != null && _items[location.x][location.y] != null)
				return _items[location.x][location.y];
			return null;
		}

		public function moveItemToLocation(gem:Gem, oldLocation:Point, newLocation:Point):void {
			_items[oldLocation.x][oldLocation.y] = null;
			_items[newLocation.x][newLocation.y] = gem;
		}

		public function interchangeItems(location1:Point, location2:Point):void {
			var gemTemp:Gem = _items[location1.x][location1.y];
			_items[location1.x][location1.y] = _items[location2.x][location2.y];
			_items[location2.x][location2.y] = gemTemp;
		}

		public function destroy():void {
			_items = null;
		}

		public function get items():Array {
			return _items;
		}

		public function set items(value:Array):void {
			_items = value;
		}
	}
}
