package {

	import flash.display.Sprite;

	import model.GameParameters;

	import net.hires.debug.Stats;

	import starling.core.Starling;
//, width="820", height="720"
	[SWF(frameRate="30", backgroundColor="0x7a868b")]
	public class Main extends Sprite {
		public function Main() {
			CONFIG::mobile {
				GameParameters.FIELD_WIDTH = 6;
				GameParameters.FIELD_HEIGHT = 9;
				GameParameters.GAME_TYPE = GameParameters.MOBILE;
			}

			CONFIG::decktop {
				GameParameters.FIELD_WIDTH = 8;
				GameParameters.FIELD_HEIGHT = 8;
				GameParameters.GAME_TYPE = GameParameters.DESKTOP;
			}

			stats = new Stats();
			stats.x = stage.stageWidth - 65;
			stats.y = stage.stageHeight - 90;
			addChild(stats);

			starling = new Starling(Game, stage);
			starling.antiAliasing = 1;
			starling.start();
		}
		private var stats:Stats;
		private var starling:Starling;
	}
}
