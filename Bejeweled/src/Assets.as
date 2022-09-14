package {
	import flash.display.Bitmap;
	import flash.utils.Dictionary;

	import starling.textures.Texture;

	public class Assets {

		[Embed("../assets/background1.png")]
		public static const background:Class;

		[Embed("../assets/hexagon.png")]
		public static const hexagon:Class;

		[Embed("../assets/oval.png")]
		public static const oval:Class;

		[Embed("../assets/rhomb1.png")]
		public static const rhomb:Class;

		[Embed("../assets/square.png")]
		public static const square:Class;

		[Embed("../assets/triangle.png")]
		public static const triangle:Class;

		[Embed("../assets/selection.png")]
		public static const selection:Class;

		[Embed("../assets/start.png")]
		public static const startButton:Class;

		[Embed("../assets/results.png")]
		public static const resultButton:Class;

		[Embed("../assets/main_menu.png")]
		public static const mainMenu:Class;

		[Embed("../assets/return_to_game.png")]
		public static const returnToGame:Class;


		private static var gameTextures:Dictionary = new Dictionary();

		public static function getTexture(name:String):Texture {
			if (gameTextures[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}
