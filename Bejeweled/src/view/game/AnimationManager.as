package view.game {
	import com.greensock.TweenLite;

	import events.GameEvent;
	import events.GameRoot;

	public class AnimationManager {

		private static var _runningAnimations:int = 0;

		public static function tweenLightTo(object:Object, duration:Number, param:Object):void {
			_runningAnimations++;
			param.onComplete = completeAnimationHandler;
			TweenLite.to(object, duration, param);

		}

		private static function completeAnimationHandler():void {
			_runningAnimations--;
			if (_runningAnimations == 0) {
				GameRoot.dispatchEvent(new GameEvent(GameEvent.ANIMATION_COMPLETE));
			}
		}

		public function AnimationManager() {

		}

	}
}
