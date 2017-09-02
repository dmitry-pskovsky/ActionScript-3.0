package characterMoveManager.adapters 
{
	import characterMoveManager.CharacterEvent;
	import common.Cell;
	import common.ICell;
	import common.ICharacter;
	import fields.BaseFieldManager;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class CharacterAdapter extends EventDispatcher implements ICharacter 
	{
		private var _character:Character;
		private var _fieldManager:BaseFieldManager;
		
		public function CharacterAdapter(_character:Character, fieldManager:BaseFieldManager) 
		{
			this._character = _character;
			_fieldManager = fieldManager;
			_character.addEventListener(Character.MOVE_COMPLETE, onMoveComplete);
		}
		
		/* INTERFACE characterMoveManager.ICharacter */
		
		public function move(cell:ICell):void 
		{
			_character.move(_fieldManager.getPositionByCell(cell));
		}
		
		public function get position():ICell 
		{
			return _fieldManager.getCellByPosition(_character.position);
		}
		
		private function onMoveComplete(event:Event):void 
		{
			dispatchEvent(new Event(CharacterEvent.CHARACTER_MOVE_COMPLETE));
		}
		
	}

}