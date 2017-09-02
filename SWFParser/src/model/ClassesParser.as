package model 
{
	import events.StreamEvent;
	import filesystem.ClassAS;
	import filesystem.FileManager;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import global.Stream;
	import org.bytearray.explorer.events.SWFExplorerEvent;
	import org.bytearray.explorer.SWFExplorer;

	/**
	 * ...
	 * @author 
	 */

	public class ClassesParser 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private static var explorer:SWFExplorer;
		private static var parser:ClassesParser;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function ClassesParser(classes:Array) 
		{
			var classAs:ClassAS;
			for each (var item:String in classes) 
			{
				classAs = new ClassAS(item);
			}
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function initialize():void
		{
			Stream.addEventListener(StreamEvent.LOAD_FILE_COMPLETE, onLoadComplete);
		}

		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================

		private static function onLoadComplete(event:StreamEvent):void 
		{
			explorer = new SWFExplorer(); 
			explorer.load(new URLRequest(File(event.data.file).nativePath));
			explorer.addEventListener(SWFExplorerEvent.COMPLETE, assetsReady);
		}

		private static function assetsReady(event:SWFExplorerEvent):void 
		{
			explorer.removeEventListener(SWFExplorerEvent.COMPLETE, assetsReady);
			parser = new ClassesParser(event.definitions);
		}

	}
}