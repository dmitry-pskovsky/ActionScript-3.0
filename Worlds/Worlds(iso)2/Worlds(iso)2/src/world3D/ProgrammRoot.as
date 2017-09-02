package world3D
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class ProgrammRoot 
	{
		private static var _eventdispatcher:EventDispatcher = new EventDispatcher();
		
		public function ProgrammRoot() 
		{
			
		}
		
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			with (_eventdispatcher) 
			{
				addEventListener(type, listener, useCapture, priority, useWeakReference);
			}
		}		
		
		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
		{ 
			with (_eventdispatcher) 
			{ 
				removeEventListener(type, listener, useCapture); 
			}
		}
		
		public static function dispatchEvent(event:Event):Boolean
		{ 
			with (_eventdispatcher) 
			{ 
				return dispatchEvent(event); 
			}
		}
		
	}

}