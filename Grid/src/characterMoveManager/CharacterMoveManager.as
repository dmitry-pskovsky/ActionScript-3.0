package characterMoveManager 
{
	import characterMoveManager.CharacterEvent;
	import common.Cell;
	import common.ICell;
	import common.IGrid;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class CharacterMoveManager 
	{
		private var _grid:IGrid;
		private var _characters:Vector.<ICharacter>;

		public function CharacterMoveManager() 
		{
			
		}
		
		public function initialize(grid:IGrid, characters:Vector.<ICharacter>):void
		{
			_grid = grid;
			_characters = characters;
			
			for (var i:int = 0; i < _characters.length; i++) 
			{
				_characters[i].addEventListener(CharacterEvent.CHARACTER_MOVE_COMPLETE, onCharacterMoveComplete);
				_characters[i].move(getRandomFreeCell());
			}
		}
		
		private function onCharacterMoveComplete(event:Event):void 
		{
			ICharacter(event.currentTarget).move(getRandomFreeCell());
		}
		
		private function getRandomFreeCell():ICell
		{
			var point:Point;
			for (var i:int = 0; i < 10; i++) 
			{
				point = new Point(Math.random() * _grid.width, Math.random() * _grid.height);
				if (_grid.checkFreeCell(point.x, point.y))
					return new Cell(point.x, point.y);
			}
			
			return null;
		}
		
	}

}