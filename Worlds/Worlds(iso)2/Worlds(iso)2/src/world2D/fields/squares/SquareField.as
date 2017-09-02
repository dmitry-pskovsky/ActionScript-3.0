package world2D.fields.squares {
	import world2D.fields.AbstractField;
	import world2D.fields.visualize.ColorProperties;
	
	public class SquareField extends AbstractSquareField {
		
		private var _width:int;
		private var _height:int;
		
		public function SquareField() {
			
		}
		
		public function drow(lineColor:ColorProperties, fillColor:ColorProperties):void {
			graphics.beginFill(fillColor.color, fillColor.alpha);
			graphics.lineStyle(1, lineColor.color, lineColor.alpha);
			graphics.drawRect(1, 1, _width - 2, _height - 2);
			graphics.endFill();
		}
		
		override public function initialize(width:int, height:int):void {
			_width = width;
			_height = height;
			setState(_state);
		}
		
		override public function setState(state:int):void {
			super.setState(state);
			
			graphics.clear();
			switch (state) {
				case STATE_EMPTY: {
					drow(visualizeType.getLineColor(STATE_EMPTY), visualizeType.getFillColor(STATE_EMPTY));
					break;
				}
				case STATE_WAY: {
					drow(visualizeType.getLineColor(STATE_WAY), visualizeType.getFillColor(STATE_WAY));
					break;
				}
				case STATE_BUSY: {
					drow(visualizeType.getLineColor(STATE_BUSY), visualizeType.getFillColor(STATE_BUSY));
					break;
				}
			}
		}
		
		
	}

}