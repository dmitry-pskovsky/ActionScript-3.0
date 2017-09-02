package world3D.directional.gui.button {
	import world3D.directional.gui.components.Outline;
	import world3D.directional.gui.components.Rectangle;
	import world3D.directional.Program;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Button extends Sprite {
		private var _background:Rectangle;
		private var _whiteOutline:Outline;
		private var _blackOutline:Outline;
		private var _greyOutline:Outline;
		private var _text:Text;
		private var _over:Over;
		private var _down:Down;
		private var _width:int = 100;
		private var _height:int = 30;
		private var	_hitArea:Rectangle;
		
		public function Button() {
			initialize();
		}
		
		private function initialize():void {
			// create Rectangle
			_background = new Rectangle();
			addChild(_background);
			
			_over = new Over();
			_over.visible = false;
			addChild(_over);
			
			_down = new Down();
			_down.visible = false;
			addChild(_down);
			
			_text = new Text();
			_text.text = 'Построить';
			addChild(_text);
			
			_hitArea = new Rectangle();
			_hitArea.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener);
			Program.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpListener);
			_hitArea.addEventListener(MouseEvent.MOUSE_OVER, mouseOverListener);
			_hitArea.addEventListener(MouseEvent.MOUSE_OUT, mouseOutListener);
			
			addChild(_hitArea);
			
			buttonMode = true;
			
		}
		
		private function mouseUpListener(e:Event):void {
			_down.visible = false;
		}
		
		private function mouseDownListener(e:Event):void {
			_over.visible = true;
			_down.visible = true;
		}
		
		private function mouseOutListener(e:Event):void {
			_over.visible = false;
		}
		
		private function mouseOverListener(e:Event):void {
			_over.visible = true;
		}
		
		public function draw(width:int, height:int):void {
			clear();
			_over.draw(width, height);
			_down.draw(width, height);
			_background.draw(width, height, 0x000000, 5, 5, 0.0);
			_text.x = width / 2 - _text.textWidth / 2;
			_text.y = height / 2 - _text.textHeight / 2 - 5;
			_hitArea.draw(width, height, 0x000000, 0, 0, 0);
		}
		
		private function clear():void {
			_background.clear();
		}
		
		public function set buttonWidth(value:int):void {
			_width = value;
			draw(_width, _height);
		}
		
		public function set buttonHeight(value:int):void {
			_height = value;
			draw(_width, _height);
		}
		
	}

}