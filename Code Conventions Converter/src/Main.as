package 
{
	import ProgramSettings;
	import events.StreamEvent;
	import files.SettingsLoader;
	import filesystem.FileManager;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.net.URLLoader;
	import parsers.ParserManager;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class Main extends Sprite 
	{
		private var file:FileManager;
		private var fileManager:FileManager;
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Main():void 
		{
			//file = new FileManager();
			//file.openFile(folder);
			
			ProgramSettings.mono = false;
			
			SettingsLoader.initialize();
			ParserManager.initialize();
			Stream.dispatchEvent(StreamEvent.LOAD_FILE);
		}
		
	}
}