package  
{
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface ICharacter extends IEventDispatcher
	{
		function get x():int;
		function get y():int;
		function set x(value:int):void;
		function set y(value:int):void;
		
		function get rotation():Number;
		function set rotation(value:Number):void;
		
		function move(x:int, y:int):void;
	}
	
}