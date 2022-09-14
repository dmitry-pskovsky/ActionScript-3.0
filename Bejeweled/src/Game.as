package {
	import events.GameEvent;
	import events.GameRoot;

	import view.screens.InGame;
	import view.screens.Results;
	import view.screens.Welcome;

	import starling.display.Sprite;
	import starling.events.Event;

	public class Game extends Sprite {
		public static const WELCOME_SCREEN:String = "WelcomeScreen";
		public static const IN_GAME_SCREEN:String = "InGameScreen";
		public static const RETURN_TO_GAME:String = "ReturnToGame";
		public static const RESULTS:String = "Results";

		public function Game() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private var inGameScreen:InGame;
		private var welcomeScreen:Welcome;
		private var results:Results;
		
		private function screenChangeHandler(event:GameEvent):void {
			switch (String(event.data)) {
				case Game.WELCOME_SCREEN:
					welcomeScreen.enable();
					inGameScreen.disable();
					results.disable();
					break;
				case Game.IN_GAME_SCREEN:
					welcomeScreen.disable();
					inGameScreen.enable();
					results.disable();
					break;
				case Game.RESULTS:
					welcomeScreen.disable();
					inGameScreen.hide();
					results.enable();
					break;
				case Game.RETURN_TO_GAME:
					welcomeScreen.disable();
					inGameScreen.show();
					results.disable();
					break;
				default:
					break;
			}
		}

		private function addedToStageHandler(event:Event):void {
			GameRoot.addEventListener(GameEvent.SCREEN_CHANGE, screenChangeHandler);

			welcomeScreen = new Welcome();
			addChild(welcomeScreen);
			welcomeScreen.enable();

			inGameScreen = new InGame();
			addChild(inGameScreen);
			inGameScreen.disable();

			results = new Results();
			addChild(results);
			results.disable();
		}
	}
}
