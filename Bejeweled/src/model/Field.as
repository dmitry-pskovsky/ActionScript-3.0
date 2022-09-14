package model {
	import com.adobe.nativeExtensions.Vibration;

	import events.GameEvent;
	import events.GameRoot;

	import flash.geom.Point;

	public class Field extends GemsManager {

		public function Field() {
			super();
			GameRoot.addEventListener(GameEvent.ANIMATION_COMPLETE, animationCompleteHandler);
			GameRoot.addEventListener(GameEvent.GEM_ON_LOCATION_SELECTED, gemOnLocationSelectedHandler);
			initializeGemsArray();
			generateGems();
		}

		private var _activeNeigbhours:Vector.<Gem> = new Vector.<Gem>();
		private var _selectedGem:Gem;
		private var _clickedGem:Gem;
		private var _gemsToRemove:Vector.<Gem> = new Vector.<Gem>();
		private var _needToGenerate:Boolean = false;
		private var _isUpdate:Boolean = false;

		public function gemOnLocationSelectedHandler(event:GameEvent):void {
			var location:Point = Point(event.data);
			_clickedGem = getItemOnLocation(location);
			if (_selectedGem) {
				for each (var gem:Gem in _activeNeigbhours) {
					if (gem == _clickedGem) {
						interchangeGems(_selectedGem.location, gem.location);
						_isUpdate = true;
						update();
						clearSelection();
						return;
					}
				}
				clearSelection();
				_clickedGem.selected = true;
			}
			_selectedGem = _clickedGem;
			setNeighboursActive(location);
		}

		override public function destroy():void {
			GameRoot.removeEventListener(GameEvent.ANIMATION_COMPLETE, animationCompleteHandler);
			GameParameters.points = 0;
			super.destroy();
		}

		private function nextStep():void {
			if (!_isUpdate) {
				_isUpdate = true;
				update();
				return;
			}
			else {
				_isUpdate = false;
				if (_needToGenerate) {
					_needToGenerate = false;
					generateGems();
					return;
				}
				else {
					_isUpdate = false;
				}
			}
		}

		private function generateGems():void {
			while (generateLine()) {
				moveGemsOnEmptyCells();
			}
		}

		private function update():void {
			checkMaches();
			removeMachedGems();
			moveGemsOnEmptyCells();
			Preprocessor.runOnMobile(vibrate);
		}

		private function destroyGems(gemsWithSameType:Vector.<Gem>):void {
			for each (var gem:Gem in gemsWithSameType) {
				_gemsToRemove.push(gem);
			}
		}

		private function removeMachedGems():void {
			if (_gemsToRemove.length > 0) {
				_needToGenerate = true;
			}

			for each (var gem:Gem in _gemsToRemove) {
				gem.destroy();
				grid.items[gem.location.x][gem.location.y] = null;
			}
			_gemsToRemove = new Vector.<Gem>();
		}

		private function vibrate():void {
			var vibration:Vibration;
			if(Vibration.isSupported) {
				vibration = new Vibration();
				vibration.vibrate(500);
			}
		}

		private function moveGemsOnEmptyCells():void {
			var gem:Gem;
			var firstLineEmpty:Boolean = false;
			for (var i:int = grid.items.length - 2; i >= 0; i--) {
				for (var j:int = 0; j < grid.items.length; j++) {
					gem = getItemOnLocation(new Point(j, i));
					if (gem != null) {
						moveDown(gem);
					}
					else {
						if (i == 0)
							firstLineEmpty = true;
					}
				}
			}

			if (firstLineEmpty) {
				nextStep();
			}

		}

		private function moveDown(gem:Gem):void {
			var newLocation:Point;
			var currentLocation:Point = gem.location;
			var targetGem:Gem = gem;
			var gem:Gem;

			while (true) {
				newLocation = new Point(currentLocation.x, currentLocation.y + 1);
				if (newLocation.y > GameParameters.FIELD_HEIGHT - 1 || getItemOnLocation(newLocation) != null) {
					if (gem.location != currentLocation)
						moveGemToLocation(targetGem, targetGem.location, currentLocation);
					return;
				}
				else {
					currentLocation = newLocation;
				}
			}
		}

		private function checkMaches():void {
			for (var i:int = 0; i < grid.items.length; i++) {
				checkHorizontalMachesOf(grid.items[0][i]);
			}
			for (i = 0; i < grid.items.length; i++) {
				checkVerticalMachesOf(grid.items[i][0]);
			}
		}

		private function checkVerticalMachesOf(gem:Gem):void {
			var location:Point = gem.location;
			var startType:int = -1;
			var gemsWithSameType:Vector.<Gem> = new Vector.<Gem>();
			var currentGem:Gem = gem;

			while (currentGem != null) {
				if (startType < 0) {
					startType = currentGem.type;
				}
				if (currentGem.type == startType) {
					gemsWithSameType.push(currentGem);
				}
				else {
					if (gemsWithSameType.length >= 3) {
						destroyGems(gemsWithSameType);
					}
					gemsWithSameType = new Vector.<Gem>();
					gemsWithSameType.push(currentGem);
					startType = currentGem.type;
				}
				location = new Point(location.x, location.y + 1);
				currentGem = getItemOnLocation(location);
			}
			if (gemsWithSameType.length >= 3) {
				destroyGems(gemsWithSameType);
			}
		}

		private function checkHorizontalMachesOf(gem:Gem):void {
			var location:Point = gem.location;
			var startType:int = -1;
			var gemsWithSameType:Vector.<Gem> = new Vector.<Gem>();
			var currentGem:Gem = gem;

			while (currentGem != null) {
				if (startType < 0) {
					startType = currentGem.type;
				}
				if (currentGem.type == startType) {
					gemsWithSameType.push(currentGem);
				}
				else {
					if (gemsWithSameType.length >= 3) {
						destroyGems(gemsWithSameType);
					}
					gemsWithSameType = new Vector.<Gem>();
					gemsWithSameType.push(currentGem);
					startType = currentGem.type;
				}
				location = new Point(location.x + 1, location.y);
				currentGem = getItemOnLocation(location);
			}
			if (gemsWithSameType.length >= 3) {
				destroyGems(gemsWithSameType);
			}
		}

		private function clearSelection():void {
			_selectedGem.selected = false;
			_clickedGem.selected = false;
			_selectedGem = null;
			_activeNeigbhours = null;
		}

		private function setNeighboursActive(location:Point):void {
			_activeNeigbhours = null;
			_activeNeigbhours = new Vector.<Gem>();

			_activeNeigbhours.push(getItemOnLocation(new Point(location.x + 1, location.y)));
			_activeNeigbhours.push(getItemOnLocation(new Point(location.x - 1, location.y)));
			_activeNeigbhours.push(getItemOnLocation(new Point(location.x, location.y + 1)));
			_activeNeigbhours.push(getItemOnLocation(new Point(location.x, location.y - 1)));
		}

		private function animationCompleteHandler(event:GameEvent):void {
			nextStep();
		}
	}
}
