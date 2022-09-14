package view.characters {
	import com.greensock.easing.Linear;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	public class Character extends Sprite {
		public static const START_TO_MOVE:String = "StartToMove";

		private const MOTION_TIME:Number = 0.5;
		private var _arrow:Sprite;

		public function Character() {
			super();
			initialize();
		}

		private function initialize():void {
			_arrow = new Arrow;
			addChild(_arrow);
		}

		public function moveToLocation(location:Point):void {
			var newRotation:Number = getRotation(0, 0, location.x, location.y);

			if (newRotation != rotation) {
				AnimationManager.playCharacterAnimation(this, {
					rotation: newRotation,
					ease: Linear.easeNone
				}, 0.2);
			}
		}

		private function getRotation(x1:int, y1:int, x2:int, y2:int):Number {
			var radians:Number = Math.atan2(y2 - y1, x2 - x1);
			var angle:Number = (radians / Math.PI) * 180;

			if (Math.abs(rotation) > 90 && Math.abs(angle) > 90)
				if (!(rotation + angle < -180) && !(rotation + angle > 180))
					if (angle < 0)
						angle += 360;
					else
						angle -= 360;

			return angle;
		}
	}
}
