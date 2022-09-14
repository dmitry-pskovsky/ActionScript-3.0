package {

	import flash.display.Sprite;

	import view.characters.Map;

	[SWF(width=800, height = 600)]
	public class Main extends Sprite {
		private var _map:Map;

		public function Main() {
			_map = new Map();
			_map.x = 5 * Constants.SIZE;
			_map.y = 5 * Constants.SIZE;
			addChild(_map);
		}
	}
}
