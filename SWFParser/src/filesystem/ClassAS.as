package filesystem
{
	import events.StreamEvent;
	import flash.filesystem.File;
	import global.Resources;
	import global.Stream;
	import global.Utils;
	import model.feathers.ClassContentGenetratorFeathers;
	import model.flashBase.ClassContentGeneratorFlashBase;
	import parsers.components.IComponent;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class ClassAS
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================
		
		private var _nodes:Array = [];
		private var _file:File;
		
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================
		
		public function ClassAS(path:String)
		{
			_nodes = path.split(".");
			
			_file = new File(Resources.guiPath);
			
			for (var i:int = 0; i < _nodes.length; i++)
			{
				if (i == _nodes.length - 1)
				{
					createClass(path);
				}
				else
				{
					openFolder(_nodes[i]);
				}
			}
		}
		
		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================
		
		private function createClass(path:String):void
		{
			var class1:Class = Utils.getClass(path);
			
			//var classContentGenerator:IComponent = new ClassContentGeneratorFlashBase(new class1(), path);
			var classContentGenerator:IComponent = new ClassContentGenetratorFeathers(new class1(), path);
			_file = _file.resolvePath(_file.nativePath + "\\" + Utils.getClassNameByPath(path));
			var fileManager:FileManager = new FileManager();
			fileManager.saveFile(_file, classContentGenerator.text());
		}
		
		private function openFolder(name:String):void
		{
			var files:Array = _file.getDirectoryListing();
			
			for each (var file:File in files)
			{
				if (file.isDirectory)
				{
					if (file.name != "." && file.name != "..")
					{
						if (file.name == name)
						{
							_file = _file.resolvePath(file.nativePath);
							return;
						}
					}
				}
			}
			_file = _file.resolvePath(name);
			_file.createDirectory();
		
		}
	
	}
}