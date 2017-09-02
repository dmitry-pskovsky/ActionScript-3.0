package  
{
	import dwarfs.inhabitants.Magician;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CharacterElmiriya extends EventDispatcher implements IDisplayObject
	{
		private var _position:Point;
		private var _body:MovieClip;
		private var _arrow:Sprite;
		private var _smothlyMoveManager:SmothlyMoveManager;
		private var _characterAnimationManager:CharacterAnimationManager;
		
		public static var MOVE_COMPLETE:String = "MoveComplete";
		
		public function CharacterElmiriya(position:Point) 
		{
			_body = new Magician();
			_body.x = position.x;
			_body.y = position.y + 10; 
			_body.scaleX = _body.scaleY = 0.7;
			_body.stop();
			_position = position;
			
			_smothlyMoveManager = new SmothlyMoveManager();
			_smothlyMoveManager.addEventListener(SmothlyMoveManager.MOVE_COMPLETE, onSmothlyMoveManagerComplete);
			
			_characterAnimationManager = new CharacterAnimationManager();
			_characterAnimationManager.initialize(_body);
		}
		
		private function onSmothlyMoveManagerComplete(e:Event):void 
		{
			_position = new Point(_body.x, _body.y - 10);
			dispatchEvent(new Event(MOVE_COMPLETE));
		}
		
		public function get position():Point 
		{
			return _position;
		}
		
		public function move(destination:Point):void
		{
			_smothlyMoveManager.moveTo(_body, destination, 0.6);
			_characterAnimationManager.moveTo(destination.x - _position.x, destination.y - _position.y);
		}
		
		/* INTERFACE IDisplayObject */
		
		public function get body():DisplayObject 
		{
			return _body;
		}
	}

}