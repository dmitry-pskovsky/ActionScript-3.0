package  
{
	import character.IFieldManager;
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
		private var _mc:Sprite;
		private var _time:Number;
		private var _rotation:Number;
		private var _destination:Point;
		private var _fieldManager:IFieldManager;
		
		public static const MOVE_COMPLETE:String = "MoveComplete";
		
		public function SmothlyMoveManager() {
		}
		
		public function moveTo(mc:Sprite, point:Point, time:Number = 1):void {
			_mc = mc;
			_time = time;
			_rotation = _mc.rotation;
			_destination = point;

			var newRotation:Number = getRotation(_mc.x, _mc.y, _destination.x, _destination.y);
			
			if (newRotation == _rotation)
				TweenLite.to(_mc, _time, { x:_destination.x, y:_destination.y, ease:Linear.easeNone, onComplete:completeMoveHandler } );
			else
				TweenLite.to(_mc, _time * 0.1, {rotation:newRotation, ease:Linear.easeNone, onComplete:completeRotationHandler});
		}
		
		private function completeRotationHandler():void 
		{
			TweenLite.to(_mc, _time * 0.9, {x:_destination.x, y:_destination.y, ease:Linear.easeNone, onComplete:completeMoveHandler});
		}
		
		private function completeMoveHandler():void 
		{
			dispatchEvent(new Event(MOVE_COMPLETE));
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