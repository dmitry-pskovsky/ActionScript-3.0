package {
	import adapters.CharacterAdapter;
	import adapters.GridAdapter;
	import character.Character;
	import character.Character2;
	import characterMoveManager.CharacterEvent;
	import characterMoveManager.CharacterMoveManager;
	import characterMoveManager.ICharacter;
	import common.Cell;
	import common.ICell;
	import fl.controls.Button;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import fieldManager.AbstractField;
	import fieldManager.BaseFieldManager;
	import fieldManager.Field;
	import grid.Grid;
	
	/**
	 * ...
	 * @author Dmitry
	 */
	public class Main extends Sprite {
		
		private var _timer:Timer;
		private var _character:Character;
		private var _charactersContainer:DisplayObjectsContainer;
		private var _grid:Grid;
		private var _baseFieldManager:BaseFieldManager;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			createRectManager();
		}
		
		private function createRectManager():void {
			
			_timer = new Timer(500);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
			
			
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
			
			var character1:Character2 = new Character2(new GridAdapter(_grid), generateRandomFreeCell());
			addChild(character1.body);
			characters.push(new CharacterAdapter(character1));
			
			character1 = new Character2(new GridAdapter(_grid), generateRandomFreeCell());
			addChild(character1.body);
			characters.push(new CharacterAdapter(character1));
			
			character1 = new Character2(new GridAdapter(_grid), generateRandomFreeCell());
			addChild(character1.body);
			characters.push(new CharacterAdapter(character1));
			
			character1 = new Character2(new GridAdapter(_grid), generateRandomFreeCell());
			addChild(character1.body);
			characters.push(new CharacterAdapter(character1));
			
			character1 = new Character2(new GridAdapter(_grid), generateRandomFreeCell());
			addChild(character1.body);
			characters.push(new CharacterAdapter(character1));
			
			var _characterMoveManager:CharacterMoveManager = new CharacterMoveManager();
			_characterMoveManager.initialize(new GridAdapter(_grid), characters);
			//character1.move(new Cell(9, 9));
			/*
			_charactersContainer = new DisplayObjectsContainer();
			addChild(_charactersContainer);
			
			onButtonClickHandler(null);
			
			var button:Button = new Button();
			button.label = "reset";
			button.y = 380;
			button.addEventListener(MouseEvent.CLICK, onButtonClickHandler);
			addChild(button);
			*/
		}
		
		private function onButtonClickHandler(event:MouseEvent):void 
		{
			removeCharacters();
			generateCharacters();
		}
		
		private function removeCharacters():void 
		{
			_charactersContainer.clear();
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
		
		private function generateCharacters():void 
		{
			for (var i:int = 0; i < 1; i++) 
			{
				var character1:Character = new Character(_baseFieldManager, generateRandomFreeCell());
				var clickManager:MouseEventManager = new MouseEventManager(_baseFieldManager, character1);
				character1.clickManager = clickManager;
				_charactersContainer.addObject(character1);
			}
		}
		
		private function onTimer(e:TimerEvent):void {
			//_charactersContainer.update();
		}
		
	}
	
}