package characters.animationManager 
{
	import characters.animationManager.BaseCharacterAnimationManager;
	import characters.BaseCharacter;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class CharacterAnimationManager extends BaseCharacterAnimationManager
	{
		private var _character:Sprite;
		private var _rotation:Number;
		
		public function CharacterAnimationManager() 
		{
			
		}
		
		override public function initialize(character:BaseCharacter):void 
		{
			_character = Sprite(character.body);
			_rotation = _character.rotation;
		}
		
		override public function moveTo(destination:Point):void 
		{
			var newRotation:Number = getRotation(_character.x, _character.y, destination.x, destination.y);
			
			if (newRotation != _rotation)
				_character.rotation = newRotation;
		}

		private function getRotation(x1:int, y1:int, x2:int, y2:int):Number
		{
			var radians:Number = Math.atan2(y2 - y1, x2 - x1);
			var angle:Number = (radians / Math.PI) * 180;
			
			if (Math.abs(_rotation) > 90 && Math.abs(angle) > 90)
				if (!(_rotation + angle < -180) && !(_rotation + angle > 180))
					if (angle < 0)
						angle += 360;
					else
						angle -= 360;
						
			return angle;
		}
		
	}

}