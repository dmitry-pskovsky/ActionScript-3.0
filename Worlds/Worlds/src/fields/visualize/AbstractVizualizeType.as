package fields.visualize {
	
	public class AbstractVizualizeType {
		
		public function AbstractVizualizeType() {
			
		}
		
		public function getLineColor(type:int):ColorProperties {
			return new ColorProperties(0x000000, 1);
		}
		
		public function getFillColor(type:int):ColorProperties {
			return new ColorProperties(0x000000, 1);
		}
		
	}

}