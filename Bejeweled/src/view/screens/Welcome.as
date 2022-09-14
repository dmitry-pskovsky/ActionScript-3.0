package view.screens {
	import events.GameEvent;
	import events.GameRoot;

	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;

	public class Welcome extends Sprite {
		public function Welcome() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private var _startButton:Button;

		public function disable():void {
			visible = false;
		}

		public function enable():void {
			visible = true;
		}

		private function drawScreen():void {
			_startButton = new Button(Assets.getTexture("startButton"));
			_startButton.x = (stage.stageWidth - _startButton.width) / 2;
			_startButton.y = (stage.stageHeight - _startButton.height) / 2;
			addChild(_startButton);
		}

		private function addedToStageHandler(event:Event):void {
			addEventListener(Event.TRIGGERED, startButtonPressHandler);
			drawScreen();
		}

		private function startButtonPressHandler(event:Event):void {
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == _startButton) {
				GameRoot.dispatchEvent(new GameEvent(GameEvent.SCREEN_CHANGE, Game.IN_GAME_SCREEN));
			}
		}
	}
}
