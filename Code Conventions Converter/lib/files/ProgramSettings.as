package files 
{
	import filesystem.FileManager;
	import flash.filesystem.File;
	import parsers.appearance.AppearanceStyle;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class ProgramSettings 
	{
		private var _completeLoadHandler:Function;
		private static var _fileManager:FileManager;
		private static var _fileManager2:FileManager;
		
		private static var _appearance:AppearanceStyle;
		private static var _structure:Vector.<String>;
		private static var _mono:Boolean;
		
		private var _appLoaded:Boolean;
		private var _structLoaded:Boolean;
		
		public function ProgramSettings() 
		{
			_appLoaded = false;
			_structLoaded = false;
		}
		
		private function loadHandler(content:String):void 
		{
			_appearance = new AppearanceStyle(JSON.parse(content));
			_appLoaded = true;
			complete();
		}
		
		private function loadHandler2(content:String):void 
		{
			_structure = new Vector.<String>();
			var o:Object = JSON.parse(content);
			for each (var item:String in o.structure) 
			{
				_structure.push(item);
			}
			_structLoaded = true;
			complete();
		}
		
		public function load(completeLoadHandler:Function):void
		{
			_completeLoadHandler = completeLoadHandler;
			
			var file:File = new File(File.applicationDirectory.nativePath + "\\" + Settings.SETTINGS_FILE);
			
			_fileManager = new FileManager();
			_fileManager.loadFileStream(file, loadHandler);
			
			file = new File(File.applicationDirectory.nativePath + "\\" + Settings.STRUCTURE_FILE);
			_fileManager2 = new FileManager();
			_fileManager2.loadFileStream(file, loadHandler2);
		}
		
		private function complete():void 
		{
			if (_appLoaded && _structLoaded)
			{
				_completeLoadHandler();
				dispose();
			}
		}
		
		public function dispose():void 
		{
			_fileManager.dispose();
			_fileManager2.dispose();
		}
		
		public static function get appearance():AppearanceStyle 
		{
			return _appearance;
		}
		
		public static function get structure():Vector.<String> 
		{
			return _structure;
		}
		
		public static function get mono():Boolean 
		{
			return _mono;
		}

		public static function set mono(value:Boolean):void 
		{
			_mono = value;
		}
		
	}

}