package world3D.directional.gui.button 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Text extends Sprite
	{
		private var _textField:TextField;
		private var _textFormat:TextFormat;
		
		public function Text() 
		{
			_textFormat = new TextFormat();
			_textFormat.color = 0xFFFFFF;
			_textFormat.size = 17;
			_textFormat.font = 'Segoe UI'
			
			_textField = new TextField();
			_textField.selectable = false;
			addChild(_textField);
		}
		
		public function set text(value:String):void 
		{
			_textField.text = value;
			_textField.setTextFormat(_textFormat);
		}
		
		override public function get height():Number 
		{
			return _textField.height;
		}
		
		public override function set height(value:Number):void 
		{
			super.height = value;
		}
		
		public function get textWidth():Number {
			return _textField.textWidth;
		}
		
		public function get textHeight():Number {
			return _textField.textHeight;
		}
		
	}

}