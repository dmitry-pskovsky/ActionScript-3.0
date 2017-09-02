package world3D.directional 
{
	import world3D.directional.gui.IDisplayObject;
	import world3D.directional.gui.IGuiObject;
	import world3D.directional.gui.menu.Menu;
	import world3D.directional.gui.window.Window;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Program extends Sprite implements IProgram
	{
		private var _window:Window;
		private var _blank:Blank;
		private var _menu:Menu;
		
		private static var _stage:Stage;
		private static var _fullScreen:Boolean = false;
		
		public function Program(stage:Stage) 
		{
			_stage = stage;
			initialize();
		}
		
		private function initialize():void 
		{
			_blank = new Blank();
			_blank.width = 400;
			_blank.height = 400;
			_window = new Window(_blank, 'Adobe Flash player');
			_window.x = 0;
			_window.y = 0;
			addChild(_window);
			
			_window.resizeButton.addEventListener(MouseEvent.CLICK, resizeButtonClickListener);

			setSize(_stage.stageWidth - 50, _stage.stageHeight - 60);
		}
		
		public function fullScreenListener(width:int, height:int):void {
			if (fullScreen)
			{
				_window.x = - 25;
				_window.y = - 1;
				setSize(width - 10, height - 40);
			}
			else
			{
				_window.x = 0;
				_window.y = 0;
				setSize(width - 50, height - 60);
			}
		}
		
		private function resizeButtonClickListener(event:MouseEvent):void {
			fullScreen = !fullScreen;
			dispatchEvent(new FullScreenEvent(FullScreenEvent.FULL_SCREEN, false, false, fullScreen));
		}
		
		private function initializeMenu():void {
			if (_menu)
				_menu.parent.removeChild(_menu);
			_menu = new Menu();
			_menu.draw(Menu.WIDTH, Menu.HEIGHT);
			_menu.x = _window.width - _menu.width - 2;
			_menu.y = _window.height - _menu.height - 2;
			_window.addChild(DisplayObject(_menu));
		}
		
		public function setSize(_width:int, _height:int):void {
			_blank.width = _width;
			_blank.height = _height;
			_window.content = _blank;
			//initializeMenu();
		}
		
		public static function get stage():Stage {
			return _stage;
		}
		
		static public function get fullScreen():Boolean {
			return _fullScreen;
		}
		
		static public function set fullScreen(value:Boolean):void {
			_fullScreen = value;
		}
		
	}

}