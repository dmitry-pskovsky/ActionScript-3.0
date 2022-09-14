package view.screens {
	import events.GameEvent;
	import events.GameRoot;

	import model.Field;
	import model.GameParameters;
	import model.Preprocessor;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	import view.game.FieldView;

	public class InGame extends Sprite {
		public function InGame() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private var background:Image;
		private var _mainMenu:Button;
		private var _results:Button;
		private var _score:TextField;
		private var _fieldView:FieldView;
		private var _field:Field;

		public function disable():void {
			if (_field) {
				_fieldView.destroy();
				removeChild(_fieldView);
			}
			if (_field)
				_field.destroy();
			visible = false;
		}

		public function enable():void {
			visible = true;

			// Add Field
			_fieldView = new FieldView();
			addChild(_fieldView);

			_field = new Field();
		}

		public function hide():void {
			_fieldView.visible = false;
			visible = false;
		}

		public function show():void {
			_fieldView.visible = true;
			visible = true;
		}

		private function initialize():void {
			Preprocessor.runOnDecktop(initializeButtons);
			Preprocessor.runOnDecktop(addScore);
			Preprocessor.runOnDecktop(addEventListeners);
		}

		private function addEventListeners():void {
			addEventListener(Event.TRIGGERED, mainMenuButtonPressHandler);
			GameRoot.addEventListener(GameEvent.UPDATE_SCORE, updateScoreHandler);
		}

		private function addScore():void {
			_score = new TextField(180, 80, "Score: 0", "Verdana", 20, 0xFFFFFF);
			_score.x = stage.stageWidth - _score.width;
			_score.y = _results.y + _results.height + 2;
			_score.bold = true;
			_score.border = true;
			addChild(_score);
		}

		private function initializeButtons():void {
			_mainMenu = new Button(Assets.getTexture("mainMenu"));
			_mainMenu.x = stage.stageWidth - _mainMenu.width;
			addChild(_mainMenu);

			_results = new Button(Assets.getTexture("resultButton"));
			_results.x = stage.stageWidth - _results.width;
			_results.y = _mainMenu.height + 2;
			addChild(_results);
		}

		private function addedToStageHandler(event:Event):void {
			initialize();
		}

		private function mainMenuButtonPressHandler(event:Event):void {
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == _mainMenu) {
				GameRoot.dispatchEvent(new GameEvent(GameEvent.SCREEN_CHANGE, Game.WELCOME_SCREEN));
			}
			if ((buttonClicked as Button) == _results) {
				GameRoot.dispatchEvent(new GameEvent(GameEvent.SCREEN_CHANGE, Game.RESULTS));
			}
		}

		private function updateScoreHandler(event:GameEvent):void {
			_score.text = "Score: " + GameParameters.points.toString();
		}
	}
}
