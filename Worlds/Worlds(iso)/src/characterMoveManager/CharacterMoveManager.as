package characterMoveManager 
{
	import common.Cell;
	import common.ICell;
	import common.ICharacter;
	import common.IGrid;
	import common.ISearchPathAlgorithm;
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
		private var _charactersSets:Vector.<CharacterSet>;

		public function CharacterMoveManager() 
		{
			
		}
		
		public function initialize(grid:IGrid, characters:Vector.<ICharacter>, searchPathAlgorithm:ISearchPathAlgorithm):void
		{
			_grid = grid;
			_characters = characters;
			_charactersSets = new Vector.<CharacterSet>();
			var characterSet:CharacterSet;
			
			for (var i:int = 0; i < _characters.length; i++) 
			{
				characterSet = new CharacterSet(_characters[i], new PathManager(_characters[i], searchPathAlgorithm));
				characterSet.pathManager.addEventListener(PathManager.MOVE_COMPLETE, onCharacterMoveComplete);
				characterSet.pathManager.setPath(getRandomFreeCell());
				_charactersSets.push(characterSet);
			}
		}
		
		private function onCharacterMoveComplete(event:Event):void 
		{
			PathManager(event.target).setPath(getRandomFreeCell());
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