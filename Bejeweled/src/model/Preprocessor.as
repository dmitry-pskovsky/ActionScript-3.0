package model {
	public class Preprocessor {

		public function Preprocessor() {

		}

		public static function runOnMobile(handler:Function):void {
			if(GameParameters.GAME_TYPE == GameParameters.MOBILE)
				handler();
		}

		public static function runOnDecktop(handler:Function):void {
			if(GameParameters.GAME_TYPE == GameParameters.DESKTOP)
				handler();
		}
	}
}
