package fieldManager {
	
	public class Field extends AbstractField {
		
		private var _width:int;
		private var _height:int;
		
		public function Field() {
			
		}
		
		override public function initialize(width:int, height:int):void {
			_width = width;
			_height = height;
			setState(STATE_EMPTY);
		}
		
		override public function setState(state:int):void {
			super.setState(state);
			
			graphics.clear();
			switch (state) {
				case STATE_EMPTY: {
					graphics.beginFill(0xAEFFA8);
					graphics.lineStyle(1, 0x0DAA00);
					graphics.drawRect(1, 1, _width - 2, _height - 2);
					graphics.endFill();
					break;
				}
				case STATE_WAY: {
					graphics.beginFill(0xB4C6F3);
					graphics.lineStyle(1, 0x0400AA);
					graphics.drawRect(1, 1, _width - 2, _height - 2);
					graphics.endFill();
					break;
				}
				case STATE_BUSY: {
					graphics.beginFill(0xFFA8A8);
					graphics.lineStyle(1, 0xAA0000);
					graphics.drawRect(1, 1, _width - 2, _height - 2);
					graphics.endFill();
					break;
				}
			}
		}
		
		
	}

}