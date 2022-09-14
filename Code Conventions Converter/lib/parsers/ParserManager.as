package parsers 
{
	import events.StreamEvent;
	import files.SettingsLoader;
	import filesystem.FileManager;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.utils.Dictionary;
	import parsers.appearance.AppearanceStyle;
	import parsers.global.Constants;
	import ProgramSettings;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class ParserManager 
	{
		private static var _fileManager:FileManager;
		private static var _file:File;
		
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function ParserManager() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function initialize():void
		{
			if (ProgramSettings.mono)
			{
				_fileManager = new FileManager();
				_fileManager.openFile(openHandler);
			}
			else
			{
				_fileManager = new FileManager();
				_fileManager.openFolder(openFolderHandler);
			}
		}
		
		private static function openFolderHandler(file:File):void 
		{
			_file = file;
			getFilesRecursive(_file);
		}
		
		private static function getFilesRecursive(folder:File):Array
		{
			var stream:FileStream;
            var files:Array = folder.getDirectoryListing();
			var items:Array = new Array;
			var t:int = 0;
			
            for each(var file:File in files) 
			{
                if (file.isDirectory)
				{
                    if (file.name != "." && file.name != "..") 
					{
							var dir:Array = getFilesRecursive(file);

							if (dir != null)
							{
								for each(var t:* in dir)
								{ items.push(t); }
							}
						
                    }
                } 
				else 
				{
					if (file.type == ".as")
					{
						openHandler(file);
					}
				}
			}
			
			return items;
		}
		
		private static function openHandler(file:File):void 
		{
			_file = file;
			var fileManager:FileManager = new FileManager();
			fileManager.loadFileStream(file, loadAsFileHandler);
		}
		
		private static function loadAsFileHandler(data:String):void 
		{
			var parser:Parser = new Parser(String(data), Operations.getFileName(_file), SettingsLoader.structure , SettingsLoader.appearance);
			//filee.saveFile(new File(File.applicationDirectory.nativePath + "\\file.as"), stt);
			_fileManager.saveFile(_file, parser.newContent);
		}

		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================

		private static function loadFileCompleteHandler(event:StreamEvent):void 
		{

		}

	}
}