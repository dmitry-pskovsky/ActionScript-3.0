package {
	import com.greensock.TweenLite;

	import events.GameEvent;

	import events.GameRoot;

	import flash.display.Sprite;

	public class AnimationManager extends Sprite {

		private static var _characterAnimationPlaing:Boolean = false;
		private static var _mapAnimationNeedToPlay:Boolean = false;

		private static var moveMapAnimationParameters:Object = {};

		public function AnimationManager() {
			super();
		}

		public static function playCharacterAnimation(target:Object, parameters:Object, duration:Number):void {
			_characterAnimationPlaing = true;
			parameters.onComplete = animationCompleteHandler;
			TweenLite.to(target, duration, parameters);
		}

		private static function animationCompleteHandler():void {
			_characterAnimationPlaing = false;
			if(_mapAnimationNeedToPlay) {
				moveMapAnimation(moveMapAnimationParameters.target, moveMapAnimationParameters.parameters, moveMapAnimationParameters.duration);
			}
		}

		public static function moveMapAnimation(target:Object, parameters:Object, duration:Number):void {
			_mapAnimationNeedToPlay = true;
			if(!_characterAnimationPlaing) {
				parameters.onComplete = moveMapAnimationCompleteHandler;
				TweenLite.to(target, duration, parameters);
				_mapAnimationNeedToPlay = false;
			}
			else {
				moveMapAnimationParameters.target = target;
				moveMapAnimationParameters.parameters = parameters;
				moveMapAnimationParameters.duration = duration;
			}
		}

		public static function moveMapAnimationCompleteHandler():void {
			GameRoot.dispatchEvent(new GameEvent(GameEvent.ANIMATION_COMPLETE));
		}
	}
}