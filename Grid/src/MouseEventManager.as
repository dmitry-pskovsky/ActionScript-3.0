package
{
	import character.Character;
	import character.IFieldManager;
	import common.ICell;
	import events.GameEvent;
	import flash.events.MouseEvent;
	import fieldManager.AbstractField;
	import fieldManager.Field;
	
	public class MouseEventManager
	{
		
		private var _fieldManager:IFieldManager;
		private var _character:Character;
		
		public function MouseEventManager(fieldManager:IFieldManager, character1:Character)
		{
			_fieldManager = fieldManager;
			_character = character1;
			
			GameStream.addEventListener(GameEvent.CELL_CLICK, cellClickHandler);
			GameStream.addEventListener(GameEvent.CELL_MOUSE_DOWN, cellDownHandler);
			GameStream.addEventListener(GameEvent.CELL_MOUSE_UP, cellUpHandler);
		}
		
		private function cellDownHandler(event:GameEvent):void 
		{
			if (AbstractField(event.data).state == AbstractField.STATE_BUSY)
				_fieldManager.editingMode = true;
		}
		
		private function cellUpHandler(event:GameEvent):void 
		{
			_fieldManager.editingMode = false;
		}
		
		private function cellClickHandler(e:GameEvent):void
		{
			var cell:ICell;
			if (AbstractField(e.data).state == AbstractField.STATE_EMPTY)
			{
				cell = _fieldManager.getCellByPosition(AbstractField(e.data).x, AbstractField(e.data).y);
				_character.moveTo(cell);
			}
		}
	
	}

}