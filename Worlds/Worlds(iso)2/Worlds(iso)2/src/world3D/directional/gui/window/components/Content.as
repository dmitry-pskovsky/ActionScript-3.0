package world3D.directional.gui.window.components 
{
	import world3D.directional.gui.components.Rectangle;
	import world3D.directional.gui.components.Outline;
	import world3D.directional.gui.window.events.WindowEvent;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Content extends Sprite {
		
		private var _background:Rectangle;
		private var _blackOutline:Outline;
		private var _whiteOutline:Outline;
		private var _width:int;
		private var _height:int;
		
		public function Content() {
			initialize();
		}
		
		private function initialize():void 
		{
			_background = new Rectangle();
			addChild(_background);
			
			_blackOutline = new Outline();
			addChild(_blackOutline);
			
			_whiteOutline = new Outline();
			addChild(_whiteOutline);
			
			_width = 100;
			_height = 100;
		}
		
		public function draw(width:int, height:int):void {
			_background.draw(width, height, 0xFFFFFF);
			_blackOutline.draw(width, height, 0x000000);
			_whiteOutline.draw(width + 2, height + 2, 0xFFFFFF, 0, 0, 1, 0.7);
			_whiteOutline.x = -1;
			_whiteOutline.y = -1;
		}
		
		public function clear():void {
			_background.clear();
			_blackOutline.clear();
			_whiteOutline.clear();
		}	
				
		public function get contentWidth():int 
		{
			return _width;
		}
		
		public function get contentHeight():int 
		{
			return _height;
		}
		
		public function set contentWidth(value:int):void 
		{
			_width = value;
			clear();
			draw(_width, _height);
			dispatchEvent(new WindowEvent(WindowEvent.CHANGE_CONTENT_SIZE, { contentWidth: _width, contentHeight: _height } ));
		}
		
		public function set contentHeight(value:int):void 
		{
			_height = value;
			clear();
			draw(_width, _height);
			dispatchEvent(new WindowEvent(WindowEvent.CHANGE_CONTENT_SIZE, { contentWidth: _width, contentHeight: _height } ));
		}
		
	}

}