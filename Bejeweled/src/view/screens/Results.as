package view.screens {
	import events.GameEvent;
	import events.GameRoot;

	import model.GameParameters;

	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class Results extends Sprite {
		public function Results() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private var _score:TextField;
		private var _returnToGame:Button;

		public function disable():void {
			visible = false;
		}

		public function enable():void {
			_score.text = "Score: " + GameParameters.points.toString();
			visible = true;
		}

		private function initialize():void {
			_returnToGame = new Button(Assets.getTexture("returnToGame"));
			_returnToGame.x = (stage.stageWidth - _returnToGame.width) / 2;
			_returnToGame.y = (stage.stageHeight - _returnToGame.height) / 2 - 45;
			addChild(_returnToGame);

			// Add text field
			_score = new TextField(180, 80, "Score: 0", "Verdana", 20, 0xFFFFFF);
			_score.x = (stage.stageWidth - _score.width) / 2;
			_score.y = (stage.stageHeight - _score.height) / 2 + 45;
			;
			_score.bold = true;
			_score.border = true;
			addChild(_score);

			addEventListener(Event.TRIGGERED, mainMenuButtonPressHandler);
		}

		private function addedToStageHandler(event:Event):void {
			initialize();
		}

		private function mainMenuButtonPressHandler(event:Event):void {
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == _returnToGame) {
				GameRoot.dispatchEvent(new GameEvent(GameEvent.SCREEN_CHANGE, Game.RETURN_TO_GAME));
			}
		}
	}
}
