package 
{
	import events.StreamEvent;
	import files.ProgramSettings;
	import filesystem.FileManager;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import global.Resources;
	import global.Stream;
	import gui.example.ExampleClass;
	import gui.example.ExampleClassTemplate;
	import model.ClassesParser;
	import org.aswing.BorderLayout;
	import org.aswing.ext.Form;
	import org.aswing.geom.IntDimension;
	import org.aswing.JButton;
	import org.aswing.JFrame;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.JSpacer;
	import org.aswing.JTextField;
	import org.aswing.JViewport;
	import org.aswing.JWindow;

	/**
	 * ...
	 * @author 
	 */

	public class Main extends Sprite 
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _textfield1 : JTextField;
		private var _textfield2 : JTextField;
		private var okBtn : JButton;
		private var setGUIPathButton:JButton;
		private var setGUIPathButtonWindow:JWindow;
		private var jFrame : JFrame;
		private var viewPort : JViewport;
		private var _jbutton:JButton;
		private var _jWindow:JWindow;
		private var _setPathButton:JButton;
		private var _fileManager:FileManager;
		private var _loader:Loader;
		private var _file:File;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Main():void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			ClassesParser.initialize();
			Resources.initialize();
			
			var programmSettings:ProgramSettings = new ProgramSettings();
			programmSettings.load(completeLoadSettings);

			var panel:JPanel = new JPanel();
			addChild(panel);

			
			_textfield1 = new JTextField("gui.fla.Button", 8);
			_setPathButton = new JButton("set path");
			_setPathButton.addEventListener(MouseEvent.MOUSE_DOWN, setPathHandler);
			
			var form:Form = new Form();
			form.addRow(new JLabel("GUI path:"), new JSpacer(new IntDimension(8)),  _textfield1, new JSpacer(new IntDimension(8)), _setPathButton);
			//form.addRow(new JLabel("textField"), new JSpacer(new IntDimension(8)), _textfield2);
			
			viewPort = new JViewport(form);
			
			var jFrame:JFrame = new JFrame(this, "AS Class properties:");
			jFrame.getContentPane().append(panel);
			jFrame.getContentPane().append(viewPort, BorderLayout.BEFORE_LINE_BEGINS);
			jFrame.setDragable(false);
			jFrame.setClosable(false);
			jFrame.setResizable(false);
			jFrame.setSizeWH(400, 100);
		
			
			_jbutton = new JButton("Download");
			_jbutton.addEventListener(MouseEvent.MOUSE_DOWN, downLoadHandler);
			_jWindow = new JWindow(this, true);
			_jWindow.getContentPane().append( _jbutton );
			_jWindow.show();
			_jWindow.setSizeWH(150, 100);
			_jWindow.x = stage.stageWidth / 2 - _jWindow.width / 2;
			_jWindow.y = stage.stageHeight / 2 - _jWindow.height / 2;
			
			jFrame.show();

			//setGUIPathButton = new JButton("Set");
			//setGUIPathButton.addEventListener(MouseEvent.MOUSE_DOWN, setGUIPathButtonHandler);
			//setGUIPathButtonWindow = new JWindow();
			//_jWindow.getContentPane().append(setGUIPathButton);
			//setGUIPathButtonWindow.y  = 300;
			//setGUIPathButtonWindow.setSizeWH(150, 100);
			//setGUIPathButtonWindow.show();
		}
		
		private function setPathHandler(event:MouseEvent):void 
		{
			var fileManager:FileManager = new FileManager();
			fileManager.openFolder(openFolderPath);
		}
		
		private function openFolderPath(file:File):void
		{
			//Stream.dispatchEvent(StreamEvent.LOAD_FOLDER_COMPLETE, { file:file } );
			Resources.guiPath = file.nativePath;
		}

		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================
	
		private function completeLoadSettings():void 
		{
			//var ex:ExampleClass = new ExampleClass();
			//addChild(ex);
		}
		
		private function swfFileCompleteOpen(file:File):void
		{
			_file = file;
			_loader = new Loader();
			_loader.load(new URLRequest(file.nativePath));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplite);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
		}
		
		private function onComplite(event:Event):void 
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplite);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			
			Stream.dispatchEvent(StreamEvent.LOAD_FILE_COMPLETE, { file:_file, loader:_loader } );
			//Resources.guiPath = _file.nativePath;
			Resources.SFWContentLoaderInfo = _loader.contentLoaderInfo;
		}
		
		private function onError(event:IOErrorEvent):void 
		{
			trace(event.text);
					
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplite);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError)
		}

		private function downLoadHandler(event:MouseEvent):void 
		{
			var fileManager:FileManager = new FileManager();
			fileManager.openFile(swfFileCompleteOpen);
		}
	}
}