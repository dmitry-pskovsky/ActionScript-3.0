package characterMoveManager
{
	import common.ICell;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface ICharacter extends IEventDispatcher
	{
		function move(cell:ICell):void;
	}
	
}