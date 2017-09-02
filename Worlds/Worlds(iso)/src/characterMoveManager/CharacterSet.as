package characterMoveManager 
{
	import common.ICharacter;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	internal class CharacterSet extends EventDispatcher
	{
		private var _character:ICharacter;
		private var _pathManager:PathManager;
		
		public function CharacterSet(character:ICharacter, pathManager:PathManager) 
		{
			_character = character;
			_pathManager = pathManager;
		}
		
		public function get character():ICharacter 
		{
			return _character;
		}
		
		public function get pathManager():PathManager 
		{
			return _pathManager;
		}
		
	}

}