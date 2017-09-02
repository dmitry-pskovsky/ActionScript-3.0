package world3D.directional.gui.window.buttons {
	import world3D.directional.gui.components.Rectangle;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Button extends Sprite {
		
		private var _down:Down;
		private var _over:Over;
		//private var _normal:Normal;
		private var _hitArea:Rectangle;
		
		private var _rect:Shape;
		
		public function Button() {
			initialize();
		}
		
		private function initialize():void {
			_down = new Down();
			_down.visible = false;
			addChild(_down);
			
			_over = new Over();
			_over.visible = false;
			addChild(_over);
			
			_hitArea = new Rectangle();
			_hitArea.addEventListener(MouseEvent.MOUSE_OVER, mouseOverListener);
			_hitArea.addEventListener(MouseEvent.MOUSE_OUT, mouseOutListener);
			addChild(_hitArea);
			
			// Drae rect shape
			_rect = new Shape();
			addChild(_rect);
			_rect.graphics.lineStyle(2, 0xFFFFFF, 1, false, "normal", null, null, 9);
			_rect.graphics.drawRect(2, 2, 10, 10);
			_rect.x = width / 2 - 1;
			_rect.y = height / 2 - 3;
		}
		
		private function mouseOutListener(e:Event):void {
			_over.visible = false;
		}
		
		private function mouseOverListener(e:Event):void {
			_over.visible = true;
		}
		
		public function draw(width:int, height:int):void {
			_down.draw(width, height);
			_over.draw(width, height);
			_hitArea.draw(width, height, 0x000000, 0, 0, 0);
		}
		
	}

}