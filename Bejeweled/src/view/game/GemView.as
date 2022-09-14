package view.game {
	import events.GameEvent;

	import flash.geom.Point;

	import model.Gem;

	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class GemView extends Sprite {

		public function GemView(gem:Gem, field:FieldView) {
			super();
			_gem = gem;
			_field = field;
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private var _gem:Gem;
		private var _field:FieldView;
		private var _background:Image;
		private var _selectionImage:Image;

		private var _selected:Boolean = false;

		public function get selected():Boolean {
			return _selected;
		}

		public function set selected(value:Boolean):void {
			_selected = value;
			_selectionImage.visible = value;
		}

		private function drawSelection():void {
			_selectionImage = new Image(Assets.getTexture("selection"));
			_selectionImage.visible = false;
			addChild(_selectionImage);
		}

		private function addEventListeners():void {
			stage.addEventListener(TouchEvent.TOUCH, touchHandler);
			_gem.addEventListener(GameEvent.GEM_POSITION_CHANGE, positionChangeHandler);
			_gem.addEventListener(GameEvent.GEM_SELECTION_CHANGE, selectionChangeHandler);
			_gem.addEventListener(GameEvent.GEM_DELETED, gemDeletedHandler);
		}

		private function destroy():void {
			stage.removeEventListener(TouchEvent.TOUCH, touchHandler);
			_gem.removeEventListener(GameEvent.GEM_POSITION_CHANGE, positionChangeHandler);
			_gem.removeEventListener(GameEvent.GEM_SELECTION_CHANGE, selectionChangeHandler);
			_gem.removeEventListener(GameEvent.GEM_DELETED, gemDeletedHandler);
			_gem = null;
			if (parent != null)
				parent.removeChild(this);
		}

		private function setSelected():void {
			_gem.setSelected();
		}

		private function setOnPosition(immediately:Boolean = false, initialize:Boolean = false):void {
			var position:Point = _field.getCoordsOfLocation(_gem.location);

			if (immediately) {
				x = position.x;
				y = position.y;
			}
			else {
				AnimationManager.tweenLightTo(this, 1.0, {x: position.x, y: position.y});
			}
		}

		private function draw():void {
			switch (_gem.type) {
				case Gem.TRIANGLE_TYPE:
					_background = new Image(Assets.getTexture("triangle"));
					break;
				case Gem.SQUARE_TYPE:
					_background = new Image(Assets.getTexture("square"));
					break;
				case Gem.RHOMB_TYPE:
					_background = new Image(Assets.getTexture("rhomb"));
					break;
				case Gem.OVAL_TYPE:
					_background = new Image(Assets.getTexture("oval"));
					break;
				case Gem.HEXAGON_TYPE:
					_background = new Image(Assets.getTexture("hexagon"));
					break;
				default:
					break;
			}

			_background.x = 2;
			_background.y = 2;
			addChild(_background);
		}

		private function addedToStageHandler(event:Event):void {
			addEventListeners();
			draw();
			drawSelection();
			setOnPosition(true, true);
		}

		private function gemDeletedHandler(event:GameEvent):void {
			destroy();
		}

		private function selectionChangeHandler(event:GameEvent):void {
			selected = Boolean(event.data);
		}

		private function positionChangeHandler(event:GameEvent):void {
			if (event.data && Boolean(event.data))
				setOnPosition(true);
			else
				setOnPosition();
		}

		private function touchHandler(event:TouchEvent):void {
			var touches:Vector.<Touch> = event.getTouches(this);
			var clicked:DisplayObject = event.currentTarget as DisplayObject;
			if (touches.length == 1) {
				var touch:Touch = touches[0];
				if (touch.phase == TouchPhase.ENDED) {
					setSelected();
				}
			}
		}
	}
}
