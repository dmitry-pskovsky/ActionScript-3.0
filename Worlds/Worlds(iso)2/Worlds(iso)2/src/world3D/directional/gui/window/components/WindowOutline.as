package world3D.directional.gui.window.components {
	import world3D.directional.gui.components.Outline;
	import flash.display.Sprite;
	
	
	public class WindowOutline extends Sprite {
		private var _white:Outline
		private var _black:Outline;
		
		public function WindowOutline() {
			initialize();
		}
		
		private function initialize():void {
			_black = new Outline();
			addChild(_black);
			
			_white = new Outline();
			addChild(_white);
		}
		
		public function draw(width:int, height:int):void {
			// draw white line
			_black.x = - 0.5;
			_black.y = - 0.5;
			_black.draw(width + 1, height + 1, 0x000000, 10, 10, 2);
				
			// draw black line
			_white.draw(width, height, 0xFFFFFF, 10, 10, 0.8, 0.9);
		}
		
		public function clear():void {
			_white.clear();
			_black.clear();
		}
		
	}

}