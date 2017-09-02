package characters 
{
	import com.greensock.easing.Linear;
	import com.greensock.events.TweenEvent;
	import com.greensock.TweenLite;
	import common.ICell;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SmothlyMoveManager extends EventDispatcher
	{
		private var _mc:Object;
		private var _time:Number;
		private var _destination:Point;
		
		public static const MOVE_COMPLETE:String = "MoveComplete";
		
		public function SmothlyMoveManager() {
		}
		
		public function moveTo(mc:Object, point:Point, time:Number = 1):void {
			_mc = mc;
			_time = time;
			_destination = point;
			
			TweenLite.to(_mc, _time, { x:_destination.x, y:_destination.y, ease:Linear.easeNone, onComplete:completeMoveHandler } );
		}
		
		private function completeMoveHandler():void 
		{
			dispatchEvent(new Event(MOVE_COMPLETE));
		}
		
	}

}