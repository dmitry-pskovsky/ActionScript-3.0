package  
{
	import common.ICell;
	import common.IGrid;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Character extends EventDispatcher implements IDisplayObject 
	{
		private var _position:Point;
		private var _arrow:Sprite;
		private var _smothlyMoveManager:SmothlyMoveManager;
		
		public static var MOVE_COMPLETE:String = "MoveComplete";
		
		public function Character(position:Point) 
		{
			_arrow = new Arrow;
			_arrow.x = position.x;
			_arrow.y = position.y;
			_arrow.scaleX = _arrow.scaleY = 0.5;
			_position = position;
			
			_smothlyMoveManager = new SmothlyMoveManager();
			_smothlyMoveManager.addEventListener(SmothlyMoveManager.MOVE_COMPLETE, onSmothlyMoveManagerComplete);
		}
		
		private function onSmothlyMoveManagerComplete(event:Event):void 
		{
			_position = new Point(_arrow.x, _arrow.y);
			dispatchEvent(new Event(MOVE_COMPLETE));
		}
		
		public function move(destination:Point):void
		{
			_smothlyMoveManager.moveTo(_arrow, destination, 0.5);
		}	
		
		public function get position():Point 
		{
			return _position;
		}
		
		/* INTERFACE IDisplayObject */
		
		public function get body():DisplayObject 
		{
			return _arrow;
		}
		
	}

}