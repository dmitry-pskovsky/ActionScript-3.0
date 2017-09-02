package delay 
{
	import events.ProgramEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class DelayTimer 
	{
		private static var _timer:Timer;
		
		public function DelayTimer() 
		{
			
		}
		
		public static function initialize():void
		{
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			
			Stream.addEventListener(ProgramEvent.COMPLETE_ITERATION, onComplete);
		}
		
		private static function onTimer(event:TimerEvent):void 
		{
			_timer.stop();
			Stream.dispatchEvent(new Event(ProgramEvent.START_ITERATION));
		}
		
		private static function onComplete(event:Event):void 
		{
			_timer.start();
		}
		
	}

}