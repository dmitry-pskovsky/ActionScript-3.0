package world2D.common
{
	import world2D.world2D.common.ICell;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface ICharacter extends IEventDispatcher
	{
		function move(cell:ICell):void;
		function get position():ICell;
	}
	
}