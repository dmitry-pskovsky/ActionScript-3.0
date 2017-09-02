package world2D.fields.visualize {
	
	public class ColorProperties {
		
		private var _alpha:Number;
		private var _color:uint;
		
		public function ColorProperties(color:uint, alpha:Number) {
			_color = color;
			_alpha = alpha;
		}
		
		public function get alpha():Number {
			return _alpha;
		}
		
		public function get color():uint {
			return _color;
		}
		
	}

}