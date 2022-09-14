package view.characters {
	import events.GameEvent;
	import events.GameRoot;

	import flash.display.Sprite;
	import flash.geom.Point;

	import model.AStar;
	import model.AdapterGrid;

	import view.characters.surface.Surface;

	public class Map extends Sprite {
		private var _surface:Surface;
		private var _camera:Camera;
		private var _character:Character;
		private var _aStar:AStar;

		private var _currentLocation:Point;
		private var _path:Vector.<Point> = new Vector.<Point>();

		private var _size:int = 9;

		public function Map() {
			initialize();
		}

		private function initialize():void {
			addSurface();
			addCamera();
			updateCurrentLocation();
			addCharacter();
			createAStar();
			
			GameRoot.addEventListener(GameEvent.ANIMATION_COMPLETE, animationCompleteHandler);
		}

		private function animationCompleteHandler(event:GameEvent):void {
			if(_path.length > 0)
				moveToLocation(_path.shift());
		}

		private function updateCurrentLocation():void {
			_currentLocation = new Point(int(_size / 2), int(_size / 2));
		}

		private function createAStar():void {
			_aStar = new AStar(new AdapterGrid(_surface));
		}

		private function addSurface():void {
			_surface = new Surface(_size, new Point(int(_size / 2) + 1, int(_size / 2) + 1));
			addChild(_surface);
		}

		private function addCamera():void {
			_camera = new Camera(_size);
			_camera.x = Constants.SIZE;
			_camera.y = Constants.SIZE;
			_camera.addEventListener(Camera.MOUSE_CLICK, cameraClickHandler);
			addChild(_camera);
		}

		private function addCharacter():void {
			_character = new Character();
			_character.x = Constants.SIZE * (_size / 2 + 1);
			_character.y = Constants.SIZE * (_size / 2 + 1);
			addChild(_character);
		}

		private function cameraClickHandler(event:GameEvent):void {
			var newLocation:Point = Point(event.data);

			_path = _aStar.setPath(_currentLocation, new Point(_currentLocation.x + newLocation.x, _currentLocation.y + newLocation.y));

			_path.shift();
			if(_path.length > 0)
				moveToLocation(_path.shift());
		}

		private function moveToLocation(newLocation:Point):void {
			_character.moveToLocation(new Point(newLocation.x - _currentLocation.x, newLocation.y - _currentLocation.y));
			_surface.moveToLocation(new Point(newLocation.x - _currentLocation.x, newLocation.y - _currentLocation.y));
			_currentLocation = newLocation;
		}

		private function drawBorders():void {
			graphics.lineStyle(2, 0xFF0000);
			graphics.drawRect(0, 0, 180, 180);
			graphics.endFill();
		}
	}
}
