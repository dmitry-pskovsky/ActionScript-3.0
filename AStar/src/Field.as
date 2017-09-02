package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Field extends Sprite
	{
		
		public function Field(state:int) 
		{
			setState(state);
			_textField = new TextField();
			addChild(_textField);
			setText();
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------

		public static const SIZE:int = 25;
		public static const STATE_EMPTY:int = 1;
		public static const STATE_BUSY:int = 2;
		public static const STATE_WAY:int = 3;
		
		public function setState(state:int):void 
		{
			var color:uint;
			var outline:uint;
			
			graphics.clear();
			
			switch (state) 
			{
				case STATE_EMPTY:
				{
					color = 0x9AF19E;
					outline = 0x16A31E;
					break;
				}
				case STATE_BUSY:
				{
					color = 0xF29999;
					outline = 0xBA1414;
					break;
				}
				case STATE_WAY:
				{
					color = 0xA298F3;
					outline = 0x161681;
					break;
				}
				default:
				{
					
				}
			}
			
			graphics.lineStyle(1, outline);
			graphics.beginFill(color);
			graphics.drawRect(0, 0, SIZE, SIZE);
			graphics.endFill();
			
			if(parent)
				parent.addChild(this);
		}
		
		public function setText(text:String = '0'):void
		{
			_textField.text = text;
			_textField.textColor = 0x000000;
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		
		private var _textField:TextField;
		
	}

}