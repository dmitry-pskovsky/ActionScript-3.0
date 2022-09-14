package view {
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.TweenNano;

	import events.GameEvent;

	import fl.transitions.Tween;
	import fl.transitions.easing.Regular;

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	import model.Slab;

	public class SlabView extends Sprite {
		private var value:int;
		private var position:Point;
		private var gridView:GridView;
		private var slab:Slab;
		private var upLevel:Boolean = false;;

		private static var WIDTH:int = 100;
		private static var HEIGHT:int = 100;
		private var textField:TextField;

		public function SlabView(gridView:GridView, slab:Slab) {
			this.gridView = gridView;
			this.slab = slab;
			value = slab.getValue();
			var position:Point = gridView.getCoordsOfLocation(slab.location);
			x = position.x;
			y = position.y;

			slab.addEventListener(GameEvent.MOVE_TO_LOCATION, moveToLocationHandler);
			slab.addEventListener(GameEvent.REMOVE_SLAB, removeHandler);
			slab.addEventListener(GameEvent.UP_LEVEL_SLAB, upLevelHandler);

			draw();
			getTextSize();
		}

		private var lastXCoords:int;
		private var lastYCoords:int;
		private function upLevelHandler(event:GameEvent):void {
			value = slab.getValue();
			draw();
			upLevel = true;
		}

		private function complete():void {
			if(upLevel) {
				lastXCoords = x;
				lastYCoords = y;
				TweenLite.to(this, 0.2, {
					x: lastXCoords - this.width * 0.05,
					y: lastYCoords - this.height * 0.05,
					scaleX: 1.1,
					scaleY: 1.1,
					onComplete: completeScale
				});
				upLevel = false;
			}
		}

		private function completeScale():void {
			TweenLite.to(this, 0.2, {x:lastXCoords, y:lastYCoords, scaleX:1.0, scaleY:1.0});
		}

		private function removeHandler(event:GameEvent):void {
			graphics.clear();
			parent.removeChild(this);
		}

		private function moveToLocationHandler(event:GameEvent):void {
			moveToLocation(Point(event.data));
		}

		public function moveToLocation(location:Point):void {
			draw();
			var newPosition:Point;
			newPosition = gridView.getCoordsOfLocation(location);
			TweenLite.to(this, 0.2, {x:newPosition.x, y:newPosition.y, onComplete:complete});
		}

		private function draw():void {
			graphics.clear();

			drawBackground();
			drawNumber();
		}

		private function drawBackground():void {
			graphics.beginFill(getSlabColor());
			graphics.drawRoundRect(0, 0, WIDTH, HEIGHT, 10, 10);
		}

	private function getTextSize():int {
		var textSize:int;
		var num:int = value.toString().length;

		switch (num) {
			case 1:
				textSize = 52;
				break;
			case 2:
				textSize = 48;
				break;
			case 3:
				textSize = 40;
				break;
			case 4:
				textSize = 35;
				break;
			case 5:
				textSize = 29;
				break;
			default:
				textSize = 48;
				break;
		}
		return textSize;
	}

		private function drawNumber():void {
			if (textField != null) {
				textField.parent.removeChild(textField);
			}
			textField = new TextField();
			textField.text = value.toString();
			var textFormat = new TextFormat("Arial Black", getTextSize(), getTextColor(), true, null, null, null, null, TextFormatAlign.CENTER);
			textField.setTextFormat(textFormat);
			textField.antiAliasType = AntiAliasType.ADVANCED;
			addChild(textField);
			textField.width = textField.textWidth + 5;
			textField.height = textField.textHeight + 5;
			textField.x = (WIDTH - textField.textWidth) / 2;
			textField.y = (HEIGHT - textField.textHeight) / 2 - 5;
		}

		private function getTextColor():uint {
			var textColor:uint;
			if(value == 2 || value == 4)
				textColor = 0x7d6e67;
			else
				textColor = 0xf9eff0;
			return textColor;
		}


		private function getSlabColor():uint {
			var color:uint;

			switch (value) {
				case 2:
					color = 0xfae7e0;
					break;
				case 4:
					color = 0xf6e8cb;
					break;
				case 8:
					color = 0xfab37b;
					break;
				case 16:
					color = 0xec8d55;
					break;
				case 32:
					color = 0xf57c5f;
					break;
				case 64:
					color = 0xea593a;
					break;
				case 128:
					color = 0xfad177;
					break;
				case 256:
					color = 0xf7d067;
					break;
				case 512:
					color = 0xf9ca58;
					break;
				case 1024:
					color = 0xe3ba14;
					break;
				case 2048:
					color = 0xf9ca58;
					break;
				case 4096:
					color = 0xf46674;
					break;
				case 8192:
					color = 0xf34b5c;
					break;
				case 16384:
					color = 0xeb4141;
					break;
				default:
					trace("None of the above were met");
			}
			return color;
		}
	}
}
