package characterMoveManager.adapters 
{
	import characterMoveManager.CharacterEvent;
	import common.ICharacter;
	import flash.events.Event;
	import common.ICell;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class CharacterAdapter extends EventDispatcher implements ICharacter 
	{
		private var _character:Character;
		
		public function CharacterAdapter(_character:Character) 
		{
			this._character = _character;
			_character.addEventListener(Character.MOVE_COMPLETE, onMoveComplete);
		}
		
		/* INTERFACE characterMoveManager.ICharacter */
		
		public function move(cell:ICell):void 
		{
			_character.move(cell);
		}
		
		private function onMoveComplete(event:Event):void 
		{
			dispatchEvent(new Event(CharacterEvent.CHARACTER_MOVE_COMPLETE));
		}
		
	}

}