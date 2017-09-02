package characters 
{
	import characters.animationManager.BaseCharacterAnimationManager;
	import com.greensock.loading.core.DisplayObjectLoader;
	import common.IDisplayObject;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class BaseCharacter extends EventDispatcher implements IDisplayObject 
	{
		private var _smothlyMoveManager:SmothlyMoveManager;
		protected var _body:DisplayObject;
		protected var _position:Point;
		protected var _moveSpeed:Number;
		protected var _characterAnimationManager:BaseCharacterAnimationManager;
		
		public static var MOVE_COMPLETE:String = "MoveComplete";
		
		public function BaseCharacter(body:DisplayObject, animationManager:BaseCharacterAnimationManager, position:Point, moveSpeed:Number) 
		{
			_body = body;
			_position = position;
			_moveSpeed = moveSpeed;
			
			_characterAnimationManager = animationManager;
			_characterAnimationManager.initialize(this);
			
			_smothlyMoveManager = new SmothlyMoveManager();
			_smothlyMoveManager.addEventListener(SmothlyMoveManager.MOVE_COMPLETE, onSmothlyMoveManagerComplete);
		}
		
		private function onSmothlyMoveManagerComplete(event:Event):void 
		{
			_position = new Point(_body.x, _body.y);
			dispatchEvent(new Event(MOVE_COMPLETE));
		}
		
		public function move(destination:Point):void
		{
			_smothlyMoveManager.moveTo(_body, destination, _moveSpeed);
			_characterAnimationManager.moveTo(destination);
		}	
		
		public function get position():Point 
		{
			return _position;
		}
		
		/* INTERFACE common.IDisplayObject */
		
		public function get body():DisplayObject 
		{
			return _body;
		}
		
	}

}