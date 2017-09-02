package global 
{
	import events.StreamEvent;
	import flash.display.LoaderInfo;
	import flash.filesystem.File;

	/**
	 * ...
	 * @author ...
	 */

	public class Resources 
	{
		//=========================================================================
		// PUBLIC PROPERTIES
		//=========================================================================

		private static var _SFWContentLoaderInfo:LoaderInfo;
		private static var _guiPath:String = ""; 

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Resources() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function initialize():void
		{
			//Stream.addEventListener(StreamEvent.LOAD_FILE_COMPLETE, onLoadComplete);
			//Stream.addEventListener(StreamEvent.LOAD_FOLDER_COMPLETE, onLoadFolderComplete);
			guiPath = File.applicationDirectory.nativePath;
		}
		
		private static function onLoadFolderComplete(event:StreamEvent):void 
		{
			guiPath = File(event.data.file).nativePath;
		}

		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================

		private static function onLoadComplete(event:StreamEvent):void 
		{
			SFWContentLoaderInfo = event.data.loader.contentLoaderInfo;
		}
		
		static public function get SFWContentLoaderInfo():LoaderInfo 
		{
			return _SFWContentLoaderInfo;
		}
		
		static public function set SFWContentLoaderInfo(value:LoaderInfo):void 
		{
			_SFWContentLoaderInfo = value;
		}
		
		static public function get guiPath():String 
		{
			return _guiPath;
		}
		
		static public function set guiPath(value:String):void 
		{
			_guiPath = value;
		}

	}
}