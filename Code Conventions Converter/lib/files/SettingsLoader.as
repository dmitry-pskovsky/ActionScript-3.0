package files {
	import events.StreamEvent;
	import filesystem.FileManager;
	import flash.display.Loader;
	import flash.filesystem.File;
	import parsers.appearance.AppearanceStyle;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SettingsLoader 
	{
		private static var _fileManager:FileManager;
		private static var _fileManager2:FileManager;
		
		private static var _appearance:AppearanceStyle;
		private static var _structure:Vector.<String>;
		
		public function SettingsLoader() 
		{

		}
		
		public static function initialize():void
		{
			var file:File = new File(File.applicationDirectory.nativePath + "\\" + Settings.SETTINGS_FILE);
			
			_fileManager = new FileManager();
			_fileManager.loadFileStream(file, loadHandler);
			
			file = new File(File.applicationDirectory.nativePath + "\\" + Settings.STRUCTURE_FILE);
			_fileManager2 = new FileManager();
			_fileManager2.loadFileStream(file, loadHandler2);
		}
		
		private static function loadHandler(content:String):void 
		{
			_appearance = new AppearanceStyle(JSON.parse(content));
		}
		
		private static function loadHandler2(content:String):void 
		{
			_structure = new Vector.<String>();
			var o:Object = JSON.parse(content);
			for each (var item:String in o.structure) 
			{
				_structure.push(item);
			}
		}
		
		private static function loadFileCompleteHandler(event:StreamEvent):void 
		{
			var str:String = event.data.str;
			Settings.conventionStyle = JSON.parse(str);
		}
		
		static public function get appearance():AppearanceStyle 
		{
			return _appearance;
		}
		
		static public function get structure():Vector.<String> 
		{
			return _structure;
		}
		
	}

}