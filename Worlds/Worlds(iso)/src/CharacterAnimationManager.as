package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class CharacterAnimationManager 
	{
		private static const WALK_BACK:String = "walk_back";
		private static const WALK:String = "walk";
		
		private var _character:MovieClip;
		private var _currentAnimation:String;
		private var _scale:Number;
		
		public function CharacterAnimationManager() 
		{
			
		}
		
		public function initialize(character:MovieClip):void
		{
			_character = character;
			_scale = _character.scaleX;
			_character.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (_character.currentLabel != _currentAnimation)
				_character.gotoAndPlay(_currentAnimation);
		}
		
		public function moveTo(x:int, y:int):void
		{
			if (x < 0 && y < 0)
			{
				resetAnimation();
				playAnimation(WALK_BACK);
			}
			if (x > 0 && y > 0)
			{
				resetAnimation();
				_character.scaleX = -_scale;
				playAnimation(WALK);
			}
			if (x > 0 && y < 0)
			{
				resetAnimation();
				_character.scaleX = -_scale;
				playAnimation(WALK);
			}
			if (x < 0 && y > 0)
			{
				resetAnimation();
				playAnimation(WALK);
			}
			if (x == 0 && y > 0)
			{
				resetAnimation();
				_character.scaleX = -_scale;
				playAnimation(WALK);
			}
			if (x == 0 && y < 0)
			{
				resetAnimation();
				_character.scaleX = -_scale;
				playAnimation(WALK_BACK);
			}
			if (x > 0 && y == 0)
			{
				resetAnimation();
				_character.scaleX = -_scale;
				playAnimation(WALK);
			}
			if (x < 0 && y == 0)
			{
				resetAnimation();
				playAnimation(WALK);
			}
		}
		
		private function resetAnimation():void 
		{
			_character.scaleX = _scale;
		}
		
		private function playAnimation(animation:String):void 
		{
			_currentAnimation = animation;
			_character.gotoAndPlay(animation);
		}
		
	}

}