package  
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SpriteCharacterAdapter implements ICharacter 
	{
		private var _sprite:Sprite;
		
		public function SpriteCharacterAdapter(sprite:Sprite) 
		{
			_sprite = sprite;
		}
		
		/* INTERFACE ICharacter */
		
		public function move(x:int, y:int):void 
		{
			TweenLite.to(_sprite, 0.01, {x:x, y:y, onComplete:onComplete});
		}
		
		private function onComplete():void 
		{
			dispatchEvent(new Event(MoveManager.CHARACTER_MOVE_COMPLETE));
		}

		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			_sprite.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			_sprite.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean 
		{
			return _sprite.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean 
		{
			return _sprite.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean 
		{
			return _sprite.willTrigger(type);
		}
		
		public function get x():int 
		{
			return _sprite.x;
		}
		
		public function get y():int 
		{
			return _sprite.y;
		}
		
		public function set x(value:int):void 
		{
			_sprite.x = value;
		}
		
		public function set y(value:int):void 
		{
			_sprite.y = value;
		}
		
		public function get rotation():Number 
		{
			return _sprite.rotation;
		}
		
		public function set rotation(value:Number):void 
		{
			_sprite.rotation = value;
		}
		
	}

}