package global 
{
	import events.StreamEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class Stream 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private static var _eventDispatcher:EventDispatcher = new EventDispatcher();

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Stream() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function hasEventListener(type:String):Boolean
		{
			return _eventDispatcher.hasEventListener(type);
		}

		public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public static function dispatchEvent(type:String, data:* = null):void
		{
			_eventDispatcher.dispatchEvent(new StreamEvent(type, data));
		}

		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}

	}
}