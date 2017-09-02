package world3D.directional.managers {
	import world3D.directional.managers.zsorters.SimpleZSorter;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Rotater {
		
		private static var _stage:DisplayObjectContainer;
		private static var _displayObject:DisplayObjectContainer;
		private static var _drag:Boolean;
		private static var _width:Number;
		private static var _height:Number;
		private static var _rotationX:Number;
		private static var _rotationY:Number;
		private static var _mouseX:Number;
		private static var _mouseY:Number;
		private static var _degreeX:Number;
		private static var _degreeY:Number;
		
		public function Rotater() {
			throw(new Error('Cannot be instanced'));
		}
		
		public static function makeRotatable(displayObject:DisplayObjectContainer):void {
			_displayObject = displayObject;
		}
		
		private static function mouseDownListener(e:Event):void {
			_mouseX = _stage.mouseX;
			_mouseY = _stage.mouseY;
			_rotationX = _displayObject.rotationX;
			_rotationY = _displayObject.rotationY;
			_width = _displayObject.width;
			_height = _displayObject.height;
			_degreeX = (_width / 2) / 90; 
			_degreeY = (_height / 2) / 90;
			_drag = true;
		}
		
		static private function mouseMoveListener(e:Event):void {
			if(_drag) {
				_displayObject.rotationY = _rotationY + _degreeX * (_mouseX - _stage.mouseX);
				_displayObject.rotationX = _rotationX - _degreeY * (_mouseY - _stage.mouseY);
				SimpleZSorter.sortClips(_displayObject);
			}
		}
		
		static private function mouseUpListener(e:Event):void {
			_drag = false;
		}
				
		public static function set stage(value:DisplayObjectContainer):void {
			_stage = value;
			_stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener);
			_stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpListener);
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveListener);
			
		}
		
	}

}