package filesystem
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author
	 */
	public class FileManager
	{
		private var _file:File;
		private var _handler:Function;
		private var _loader:Loader;
		private var _urlLoader:URLLoader;
		private var _fileStream:FileStream;
		
		public function FileManager()
		{
		
		}
		
		public function openFile(handler:Function):void
		{
			_handler = handler;
			_file = File.desktopDirectory;
			_file.addEventListener(Event.SELECT, fileSelectedHandler);
			_file.browseForOpen("Выберите файл");
		}
		
		public function openFolder(handler:Function):void
		{
			_handler = handler;
			_file = File.desktopDirectory;
			_file.addEventListener(Event.SELECT, folderSelectedHandler);
			_file.browseForDirectory("Выберите папку");
		}
		
		private function fileSelectedHandler(event:Event):void
		{
			_file.removeEventListener(Event.SELECT, fileSelectedHandler);
			_file = event.target as File;
			_handler(_file);
		}
		
		private function folderSelectedHandler(event:Event):void
		{
			_file.removeEventListener(Event.SELECT, folderSelectedHandler);
			_file = event.target as File;
			_handler(_file);
		}
		
		private function onComplite(event:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplite);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			
			_handler(_loader);
		}
		
		public function loadFile(file:File, handler:Function):void
		{
			_handler = handler;
			_file = file;
			
			_loader = new Loader();
			_loader.load(new URLRequest(_file.nativePath));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplite);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
		}
		
		public function loadFileStream(file:File, handler:Function):void
		{
			_handler = handler;
			_file = file;
			
			var string:String = "";
			_fileStream = new FileStream();
			_fileStream.open(file, FileMode.UPDATE);
			string = _fileStream.readUTFBytes(_fileStream.bytesAvailable);
			_fileStream.close();
			_handler(string);
		}
		
		public function saveFile(file:File, content:String, type:String = "as"):void 
		{
			if (file.type != null)
				type = file.type;
			file = file.resolvePath(file.parent.nativePath + "\\" + file.name.slice(0, file.name.length) + "." + type);
			_fileStream = new FileStream();

			_fileStream.open(file, FileMode.WRITE);
			_fileStream.writeUTFBytes(content);
			_fileStream.close();
		}
		
		private function onError(event:IOErrorEvent):void
		{
			trace(event.text);
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplite);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError)
		}
	}

}