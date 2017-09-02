package world2D.fields.visualize {
	import world2D.fields.AbstractField;
	
	public class GreyVisualizeType extends AbstractVizualizeType {
		
		public function GreyVisualizeType() {
			
		}
		
		override public function getLineColor(type:int):ColorProperties {
			switch (type) {
				case AbstractField.STATE_BUSY:
					return new ColorProperties(0x000000, 1);
				case AbstractField.STATE_WAY:
					return new ColorProperties(0x000000, 1);
				case AbstractField.STATE_EMPTY:
					return new ColorProperties(0x363636, 1);
				default:
					return super.getLineColor(type);
			}
		}

		override public function getFillColor(type:int):ColorProperties {
			switch (type) {
				case AbstractField.STATE_BUSY:
					return new ColorProperties(0x0066FF, 1);
				case AbstractField.STATE_WAY:
					return new ColorProperties(0x383838, 1);
				case AbstractField.STATE_EMPTY:
					return new ColorProperties(0x838383, 1);
				default:
					return super.getFillColor(type);
				break;
			}
		}
		
	}

}