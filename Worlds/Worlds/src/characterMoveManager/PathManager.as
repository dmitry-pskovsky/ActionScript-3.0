package characterMoveManager
{
	import aStar.SquareAStar;
	import characterMoveManager.CharacterEvent;
	import common.ICell;
	import common.ICharacter;
	import common.IGrid;
	import common.ISearchPathAlgorithm;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class PathManager extends EventDispatcher
	{
		private var _pathToDestination:Vector.<ICell>;
		private var _position:ICell;
		private var _character:ICharacter;
		private var _stepsCount:int;
		private var _searchPathAlgorithm:ISearchPathAlgorithm;
		
		public static const MOVE_COMPLETE:String = "characterMoveComplete";
		
		public function PathManager(character:ICharacter, searchPathAlgorithm:ISearchPathAlgorithm) 
		{
			_character = character;
			_position = _character.position;
			_searchPathAlgorithm = searchPathAlgorithm;
			
			_character.addEventListener(CharacterEvent.CHARACTER_MOVE_COMPLETE, onCharacterMoveComplete);
		}
		
		private function onCharacterMoveComplete(event:Event):void 
		{
			_position = _character.position;
			doStep();
		}
		
		public function setPath(destination:ICell):void
		{
			//BaseFieldManager.fieldManagerInstance.vizualizeField(destination.x, destination.y, 2);
				
			_pathToDestination = _searchPathAlgorithm.setPath(_position, destination);
			
			if(_pathToDestination.length == 1)
				_stepsCount = 0;
			else
				_stepsCount = 1;
				
			doStep();
		}
		
		private function doStep():void
		{
			if (_pathToDestination.length > _stepsCount)
				moveTo(_pathToDestination[_stepsCount++]);
			else
				dispatchEvent(new Event(MOVE_COMPLETE));
		}
		
		private function moveTo(cell:ICell):void 
		{
			_character.move(cell);
		}
		
	}

}