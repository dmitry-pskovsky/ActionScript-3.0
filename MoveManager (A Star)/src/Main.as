package 
{
	import characterMoveManager.adapters.CharacterAdapter;
	import characterMoveManager.adapters.GridAdapter;
	import characterMoveManager.CharacterMoveManager;
	import common.Cell;
	import common.ICell;
	import common.ICharacter;
	import fieldManager.AbstractField;
	import fieldManager.BaseFieldManager;
	import fieldManager.Field;
	import flash.display.Sprite;
	import flash.events.Event;
	import grid.Grid;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		private var _grid:Grid;
		private var _baseFieldManager:BaseFieldManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_grid = new Grid();
			_grid.initialize(19, 19);
			_grid.setField(3, 3, AbstractField.STATE_BUSY);
			_grid.setField(3, 4, AbstractField.STATE_BUSY);
			_grid.setField(3, 5, AbstractField.STATE_BUSY);
			
			_grid.setField(6, 6, AbstractField.STATE_BUSY);
			_grid.setField(7, 6, AbstractField.STATE_BUSY);
			_grid.setField(8, 6, AbstractField.STATE_BUSY);
			_grid.setField(9, 6, AbstractField.STATE_BUSY);
			
			
			_grid.setField(5, 4, AbstractField.STATE_BUSY);
			_grid.setField(5, 5, AbstractField.STATE_BUSY);
			_grid.setField(5, 6, AbstractField.STATE_BUSY);
			
			_baseFieldManager = new BaseFieldManager(Field, _grid);
			addChild(_baseFieldManager);
			
			var characters:Vector.<ICharacter> = new Vector.<ICharacter>();
			
			var character1:Character = new Character(new GridAdapter(_grid), generateRandomFreeCell());
			addChild(character1.body);
			characters.push(new CharacterAdapter(character1));
			
			var _characterMoveManager:CharacterMoveManager = new CharacterMoveManager();
			_characterMoveManager.initialize(new GridAdapter(_grid), characters);
		}
		
		private function generateRandomFreeCell():ICell 
		{
			var cell:Cell;
			for (var i:int = 0; i < 10; i++) 
			{
				cell = new Cell(Math.random() * _grid.width, Math.random() * _grid.height);
				if (_baseFieldManager.getField(cell.x, cell.y) == AbstractField.STATE_EMPTY)
					return cell;
			}
			return null;
		}
		
	}
	
}