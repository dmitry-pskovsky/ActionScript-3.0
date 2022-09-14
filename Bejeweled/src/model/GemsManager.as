package model {
	import flash.geom.Point;

	public class GemsManager {
		private var _grid:Grid;

		public function GemsManager() {
			_grid = new Grid(GameParameters.FIELD_WIDTH, GameParameters.FIELD_HEIGHT);
		}


		protected function initializeGemsArray():void {
			_grid.initialize();
		}

		protected function getItemOnLocation(location:Point):Gem {
			return _grid.getItemOnLocation(location);
		}

		protected function interchangeGems(location1:Point, location2:Point):void {
			Gem(_grid.getItemOnLocation(location1)).moveToLocation(location2, true);
			Gem(_grid.getItemOnLocation(location2)).moveToLocation(location1, true);
			_grid.interchangeItems(location1, location2);
		}

		protected function moveGemToLocation(gem:Gem, oldLocation:Point, newLocation:Point):void {
			_grid.moveItemToLocation(gem, oldLocation, newLocation);
			gem.moveToLocation(newLocation, false);
		}

		protected function generateLine():Boolean {
			var hadEmpty:Boolean = false;
			for (var i:int = 0; i < grid.items.length; i++) {
				if (grid.items[i][0] == null) {
					grid.items[i][0] = generateRandomGem(new Point(i, 0));
					hadEmpty = true;
				}
			}
			return hadEmpty;
		}

		private function generateRandomGem(location:Point):Gem {
			var random:int = Math.random() * 5;
			switch (random) {
				case 0:
					return new Gem(Gem.HEXAGON_TYPE, location);
				case 1:
					return new Gem(Gem.OVAL_TYPE, location);
				case 2:
					return new Gem(Gem.RHOMB_TYPE, location);
				case 3:
					return new Gem(Gem.SQUARE_TYPE, location);
				case 4:
					return new Gem(Gem.TRIANGLE_TYPE, location);
				default:
					return null;
			}
		}

		public function destroy():void {
			_grid.destroy();
		}

		public function get grid():Grid {
			return _grid;
		}
	}
}
