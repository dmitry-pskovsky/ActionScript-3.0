package world3D.directional.gui.window.components {
	import world3D.directional.gui.components.Rectangle;
	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Title extends Sprite {
		
		private var _textField:TextField;
		private var _background:Rectangle;
		
		public function Title() {
			initialize();
		}
		
		private function initialize():void {			
			_background = new Rectangle();
			addChild(_background);
			
			_textField = new TextField();
			addChild(_textField);
		}
		
		private function get textFormat():TextFormat{
			var _textFormat:TextFormat = new TextFormat();
			_textFormat.font = 'Tahoma';
			_textFormat.color = 0x000000;
			_textFormat.size = 14;
			
			return _textFormat;
		}
		
		public function set text(value:String):void {
			_textField.text = value;
			_textField.selectable = false;
			_textField.setTextFormat(textFormat);
			_textField.width = _textField.textWidth + 50;
			
			_background.x = 2;
			_background.y = _textField.textHeight / 2;
			_background.draw(_textField.textWidth + 2, 4, 0xFFFFFF);
			_background.filters = [new BlurFilter(9, 12, BitmapFilterQuality.MEDIUM)];
		}
				
		public function get text():String {
			return _textField.text;
		}
		
	}

}