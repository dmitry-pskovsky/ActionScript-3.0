package world3D.directional.gui.window {
	import world3D.directional.gui.components.Rectangle;
	import world3D.directional.gui.window.buttons.Button;
	import world3D.directional.gui.window.components.Content;
	import world3D.directional.gui.window.components.WindowOutline;
	import world3D.directional.gui.window.components.Title;
	import world3D.directional.gui.window.events.WindowEvent;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	
	
	public class Window extends Sprite {
		private var _outline:WindowOutline;
		private var _background:Rectangle;
		private var _shadow:Rectangle;
		private var _title:Title;
		private var _content:Content;
		private var _dragWindowArea:Rectangle;
		private var _dragable:Boolean;
		private var _resizeButton:Button;
		
		// borders 
		private var _left:int = 7;
		private var _top:int	= 26;
		private var _right:int = 7;
		private var _bottom:int = 7;
		
		public function Window(content:Sprite, title:String = 'Window', dragable:Boolean = false) {
			initialize();
			this.content = content;
			this.title = title;
			this.dragable = dragable;
		}
		
		private function initialize():void {
			_dragable = false;
			
			_shadow = new Rectangle();
			addChild(_shadow);
			
			_background = new Rectangle();
			addChild(_background);
			
			_outline = new WindowOutline();
			addChild(_outline);
			
			_title = new Title();
			addChild(_title);
			
			_content = new Content();
			_content.addEventListener(WindowEvent.CHANGE_CONTENT_SIZE, contentSizeListener); 
			addChild(_content);
			
			_dragWindowArea = new Rectangle();
			addChild(_dragWindowArea);
			
			_resizeButton = new Button();
			addChild(_resizeButton);
			
			_content.contentWidth = 200;
			_content.contentHeight = 200;
		}
		
		private function mouseUpListener(e:MouseEvent):void {
			stopDrag();
		}
		
		private function mouseDownListener(e:Event):void {
			startDrag();
		}
		
		private function contentSizeListener(event:WindowEvent):void 
		{
			clear();
			draw(event.data.contentWidth, event.data.contentHeight); 
		}
		
		private function clear():void 
		{
			_shadow.clear();
			_background.clear();
			_outline.clear();
			_dragWindowArea.clear();
		}
		
		public function draw(width:int, height:int):void {
			// draw shadow first
			_shadow.draw(width + _right + _left, height + _bottom + _top, 0x000000, 10, 10);
			_shadow.filters = [new DropShadowFilter(0, 0.0, 0, 1.0, 14, 14, 1.1, BitmapFilterQuality.MEDIUM, false, true, true)];
			_shadow.x = - _left;
			_shadow.y = - _top;
			
			// draw backgound 
			_background.draw(width + _right + _left, height + _bottom + _top, 0x000000, 10, 10, 0.5);
			_background.x = - _left;
			_background.y = - _top;

			// draw outline
			_outline.draw(width + _right + _left, height + _bottom + _top);
			_outline.x = - _left;
			_outline.y = - _top;
			
			_title.x = 10 - _left;
			_title.y = 3 - _top;
			
			// draw drag window area
			_dragWindowArea.draw(width + _right + _left, _top, 0xFFFFFF, 0.0, 0.0, 0.0);
			_dragWindowArea.x = - _left;
			_dragWindowArea.y = - _top;
			
			// Draw resize button
			_resizeButton.draw(25, 20);
			_resizeButton.x = width - _resizeButton.width;
			_resizeButton.y = - _resizeButton.height - 1;
		}

		
		public function get title():String {
			return _title.text;
		}
		
		public function set title(value:String):void {
			_title.text = value;
		}
		
		public function get content():DisplayObject {
			if (_content)
				return _content;
			return null;
		}
		
		public function set content(value:DisplayObject):void {
			addChild(value);
			value.x = 4;
			value.y = 4;
			_content.contentWidth = value.width + 8;
			_content.contentHeight = value.height + 8;
		}
		
		public function set dragable(value:Boolean):void {
			if (value) {
				_dragWindowArea.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener);
				_dragWindowArea.addEventListener(MouseEvent.MOUSE_UP, mouseUpListener);
			} else {
				_dragWindowArea.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener);
				_dragWindowArea.removeEventListener(MouseEvent.MOUSE_UP, mouseUpListener);
			}
			_dragable = value;
		}
		
		override public function get width():Number {
			return super.width - _right - _left;
		}
		
		override public function get height():Number {
			return super.height - _bottom - _top;
		}
		
		override public function set x(value:Number):void {
			super.x = value + _right + _left;
		}
		
		override public function set y(value:Number):void {
			super.y = value + _top + _bottom;
		}
		
		public function get resizeButton():Button {
			return _resizeButton;
		}
		
	}

}