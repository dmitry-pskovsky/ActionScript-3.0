package  
{
	import com.greensock.easing.Linear;
	import com.greensock.events.TweenEvent;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SmothlyMoveManager 
	{
		private var _mc:Sprite;
		private var _x:int;
		private var _y:int;
		private var _time:Number;
		private var _rotation:Number;
		
		public function SmothlyMoveManager() {
			
		}
		
		public function moveTo(mc:Sprite, x:int, y:int, time:Number = 1):void {
			_mc = mc;
			_x = x;
			_y = y;
			_time = time;
			_rotation = _mc.rotation;
			TweenLite.to(_mc, _time * 0.3, {rotation:getRotation(_mc.x, _mc.y, x, y), ease:Linear.easeNone, onComplete:completeRotationHandler});
		}
		
		private function completeRotationHandler():void 
		{
			TweenLite.to(_mc, _time * 0.7, {x:_x, y:_y, ease:Linear.easeNone, onComplete:completeRotationHandler});
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