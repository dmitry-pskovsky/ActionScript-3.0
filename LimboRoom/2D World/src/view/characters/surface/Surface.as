package view.characters.surface {
	import com.greensock.easing.Linear;

	import events.GameEvent;

	import events.GameRoot;

	import flash.display.Sprite;
	import flash.geom.Point;

	public class Surface extends Sprite {
		private var _grid:Vector.<Vector.<int>> = new <Vector.<int>>[];
		private var _size:int;
		private var _currentLocation:Point;
		private var _squares:Vector.<Vector.<SurfaceSquare>>;

		public function Surface(size:int, currentLocation:Point) {
			_size = size;
			_currentLocation = currentLocation;

			initializeSquares();
			initializeGrid();
			initializeDraw();

			GameRoot.addEventListener(GameEvent.ANIMATION_COMPLETE, animationCompleteHandler);
		}

		private function animationCompleteHandler(event:GameEvent):void {
			removeOutCameraSquares();
		}

		private function removeOutCameraSquares():void {
			var mxx:int;
			var pxx:int;
			var myy:int;
			var pyy:int;
			mxx = _currentLocation.x - getVisibleConfineTo(1);
			pxx = _currentLocation.x + getVisibleConfineTo(1);
			myy = _currentLocation.y - getVisibleConfineTo(1);
			pyy = _currentLocation.y + getVisibleConfineTo(1);

			for (var i:int = 0; i < _squares.length; i++) {
				for (var j:int = 0; j < _squares[i].length; j++) {
					if(i < mxx) {
						removeSquare(new Point(i, j));
					}
					if(i > pxx) {
						removeSquare(new Point(i, j));
					}
					if(j < myy) {
						removeSquare(new Point(i, j));
					}
					if(j > pyy) {
						removeSquare(new Point(i, j));
					}
				}
			}
		}

		private function initializeSquares():void {
			_squares = new Vector.<Vector.<SurfaceSquare>>();
			for (var i:int = 0; i < 20; i++) {
				_squares.push(new Vector.<SurfaceSquare>());
				for (var j:int = 0; j < 20; j++) {
					_squares[i].push(null);
				}
			}
		}

		private function initializeGrid():void {
			for (var i:int = 0; i < 20; i++) {
				_grid.push(new Vector.<int>());
				for (var j:int = 0; j < 20; j++) {
					_grid[i].push(0);
				}
			}
		}

		private function initializeDraw():void {
			graphics.beginFill(0xAEFFA8);
			graphics.lineStyle(1, 0x0DAA00);
			for (var i:int = 0; i < _size + 2; i++) {
				for (var j:int = 0; j < _size + 2; j++) {
					addSquare(new Point(i, j));
				}
			}
			graphics.endFill();
		}

		public function moveToLocation(location:Point):void {
			updateDraw(location);
			var previousX:int = x;
			var previousY:int = y;
			AnimationManager.moveMapAnimation(this, {x:previousX - Constants.SIZE * location.x, y:previousY - Constants.SIZE * location.y, ease:Linear.easeNone}, 0.5);
			_currentLocation = new Point(_currentLocation.x + location.x, _currentLocation.y + location.y);
		}

		private function updateDraw(location:Point):void {
			var i:int;
			for (i = _currentLocation.y - visiblePart(); i <= _currentLocation.y + visiblePart() + 1; i++) {
				addSquare(new Point(_currentLocation.x + getVisibleConfineTo(location.x), i));
			}

			for (i = _currentLocation.x - visiblePart() - 1; i <= _currentLocation.x + visiblePart(); i++) {
				addSquare(new Point(i, _currentLocation.y + getVisibleConfineTo(location.y)));
			}
		}

		private function removeSquare(location:Point):void {
			if(_squares[location.x][location.y] != null)
				_squares[location.x][location.y].parent.removeChild(_squares[location.x][location.y]);
			_squares[location.x][location.y] = null;
		}

		private function addSquare(location:Point):void {
			if(location.x < 0 || location.x > _grid.length - 1)
				return;
			if(location.y < 0 || location.y > _grid[0].length - 1)
				return;

			if(_squares[location.x] == null) {
				_squares[location.x][location.y] = new SurfaceSquare(location, Constants.EMPTY);
				addChild(_squares[location.x][location.y]);
				return;
			}

			if(_squares[location.x][location.y] == null) {
				_squares[location.x][location.y] = new SurfaceSquare(location, Constants.EMPTY);
				addChild(_squares[location.x][location.y]);
				return;
			}
		}

		private function getVisibleConfineTo(value:int):int {
			var sign:int = value / Math.abs(value);
			return (visiblePart() + Math.abs(value)) * sign;
		}

		private function visiblePart():int {
			return int(_size / 2) + 1;
		}

		public function get grid():Vector.<Vector.<int>> {
			return _grid;
		}
	}
}
