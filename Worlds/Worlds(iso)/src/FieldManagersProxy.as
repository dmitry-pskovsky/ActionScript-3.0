package  
{
	import fields.BaseFieldManager;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class FieldManagersProxy 
	{
		private static var _squareFieldmanager:BaseFieldManager;
		private static var _hexagonFieldmanager:BaseFieldManager;
		
		public function FieldManagersProxy() 
		{

		}
		
		public static function initialize(squareFieldmanager:BaseFieldManager, hexagonFieldmanager:BaseFieldManager):void
		{
			_squareFieldmanager = squareFieldmanager;
			_hexagonFieldmanager = hexagonFieldmanager;
		}
		
		static public function get squareFieldmanager():BaseFieldManager 
		{
			return _squareFieldmanager;
		}
		
		static public function get hexagonFieldmanager():BaseFieldManager 
		{
			return _hexagonFieldmanager;
		}
		
	}

}