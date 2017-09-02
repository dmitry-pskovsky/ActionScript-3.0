package world3D.directional.gui.menu {
	import world3D.directional.gui.button.Button;
	import world3D.directional.gui.components.Outline;
	import world3D.directional.gui.components.Rectangle;
	import world3D.directional.gui.IDisplayObject;
	import world3D.directional.gui.IGuiObject;
	import flash.display.Sprite;
	
	public class Menu extends Sprite implements IGuiObject {
		
		private var _background:Rectangle;
		private var _outline:Outline;
		private var _outlineWhite:Outline;
		private var _button:Button;
		private var _content:Sprite;
		
		public static const WIDTH:int = 300;
		public static const HEIGHT:int = 200;
		
		public function Menu() {
			initialize();
		}
		
		private function initialize():void {
			_background = new Rectangle();
			addChild(_background);
			
			_outline = new Outline();
			addChild(_outline);
			
			_outlineWhite = new Outline();
			addChild(_outlineWhite);
			
			_content = new Sprite();
			_content.x = 10;
			_content.y = 10;
			addChild(_content);
			
			initializeButtons();
		}
		
		private function initializeButtons():void {
			_button = new Button();
			_button.draw(Menu.WIDTH - 20, 40);
			_content.addChild(_button);
		}
		
		public function draw(width:int, height:int):void {
			_background.draw(width, height, 0x000000, 0, 0, 0.8);
			_outline.draw(width, height, 0x000000);
			_outlineWhite.draw(width - 2, height - 2, 0xFFFFFF, 0, 0, 0, 0.3);
			_outlineWhite.x = 1;
			_outlineWhite.y = 1;
		}
		
	}

}