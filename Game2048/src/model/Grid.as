package model {
	import events.GameEvent;
	import events.GameRoot;

	import flash.geom.Point;

	public class Grid {

		private var slabs:Array;
		//private Slab slab;

		public function Grid() {
			initialize();
		}

		public function initialize():void {
			addEventListeners();
			initializeSlabsArray();
			createSlab();
		}

		private function addEventListeners():void {
			GameRoot.addEventListener(GameEvent.KEY_DOWN_PRESSED, keyDownPressed);
			GameRoot.addEventListener(GameEvent.KEY_UP_PRESSED, keyUpPressed);
			GameRoot.addEventListener(GameEvent.KEY_LEFT_PRESSED, keyLeftPressed);
			GameRoot.addEventListener(GameEvent.KEY_RIGHT_PRESSED, keyRightPressed);
		}

		private function initializeSlabsArray():void {
			slabs = new Array();
			for (var i:int = 0; i < 4; i++) {
				slabs[i] = new Array();
				for (var j:int = 0; j < 4; j++) {
					slabs[i][j] = null;
				}
			}
		}

		private function createSlab():Slab {
			var emptyLocations:Vector.<Point> = new Vector.<Point>();
			for (var i:int = 0; i < slabs.length; i++) {
				for (var j:int = 0; j < slabs[i].length; j++) {
					if (getSlabOnLocation(new Point(i, j)) == null) {
						emptyLocations.push(new Point(i, j));
					}
				}
			}

			var rand:int = Math.random() * emptyLocations.length;
			var location:Point = emptyLocations[rand];

			var slab:Slab = new Slab(this, location);
			addSlab(slab, location);
			GameRoot.dispatchEvent(new GameEvent(GameEvent.CREATE_SLAB, slab));

			return slab;
		}

		public function removeSlab(location:Point):void {
			slabs[location.x][location.y] = null;
		}

		public function addSlab(slab:Slab, location:Point):void {
			if (slabs[location.x][location.y] != null) {
				slabs[location.x][location.y].remove();
				slabs[location.x][location.y] = null;
				slab.up();
				slabs[location.x][location.y] = slab;
			}
			else {
				slabs[location.x][location.y] = slab;
			}

		}

		public function getSlabOnLocation(location:Point):Slab {
			return slabs[location.x][location.y];
		}

		public function isLocationEmpty(location:Point, value:int):Boolean {
			if (location.x > slabs.length - 1 || location.y > slabs.length - 1)
				return false;
			if (location.x < 0 || location.y < 0)
				return false;
			var slab:Slab = getSlabOnLocation(location);
			if (slab != null) {
				if (slab.getValue() != value)
					return false;
			}
			return true;
		}

		public function keyDownPressed(event:GameEvent):void {
			for (var i:int = slabs.length - 2; i >= 0; i--) {
				for (var j:int = 0; j < slabs.length; j++) {
					if (slabs[j][i] != null)
						slabs[j][i].keyDownPressed();
				}
			}
			createSlab();
			//iGridListener.repaint();
		}

		public function keyUpPressed(event:GameEvent):void {
			for (var i = 1; i < slabs.length; i++) {
				for (var j = 0; j < slabs.length; j++) {
					if (slabs[j][i] != null) {
						//slabs[j][i].up();
						slabs[j][i].keyUpPressed();
					}
				}
			}
			createSlab();
			//iGridListener.repaint();
		}

		public function keyRightPressed(event:GameEvent):void {
			for (var i = slabs.length - 2; i >= 0; i--) {
				for (var j = 0; j < slabs.length; j++) {
					if (slabs[i][j] != null)
						slabs[i][j].keyRightPressed();
				}
			}
			createSlab();
			//iGridListener.repaint();
		}

		public function keyLeftPressed(event:GameEvent):void {
			for (var i = 1; i < slabs.length; i++) {
				for (var j = 0; j < slabs.length; j++) {
					if (slabs[i][j] != null)
						slabs[i][j].keyLeftPressed();
				}
			}
			createSlab();
		}
	}


}
