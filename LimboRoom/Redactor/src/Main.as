package {
	import flash.display.Sprite;

	[SWF(width=500, height=500)]
	public class Main extends Sprite {
		private var surface:Surface;

		//-----------------------
		private var _map:Vector.<Vector.<int>> = new <Vector.<int>>[];
		//-----------------------

		public function Main() {
			//-----------------------
			for (var i:int = 0; i < 50; i++) {
				var vector:Vector.<int> = new Vector.<int>();
				_map.push(vector);
				for (var j:int = 0; j < 50; j++) {
					vector.push(0);
				}
			}
			//-----------------------

			surface = new Surface(_map);
			addChild(surface);
		}
	}
}
