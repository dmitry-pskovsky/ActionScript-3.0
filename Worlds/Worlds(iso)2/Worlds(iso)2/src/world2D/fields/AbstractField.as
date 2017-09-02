package world2D.fields {
	import world2D.fields.visualize.AbstractVizualizeType;
	
	public class AbstractField extends AbstractFieldEventDispatcher {
		
		public static const STATE_EMPTY:int = 1;
		public static const STATE_WAY:int = 2;
		public static const STATE_BUSY:int = 3;
		
		protected var _state:int = STATE_EMPTY;
		
		private var _visualizeType:AbstractVizualizeType;
		
		public function AbstractField() {
			
		}
		
		public function setState(state:int):void {
			_state = state;
		}
		
		public function initializeVisualizeType(visualizeType:AbstractVizualizeType):void {
			_visualizeType = visualizeType;
		}
		
		public function get state():int 
		{
			return _state;
		}
		
		protected function get visualizeType():AbstractVizualizeType {
			return _visualizeType;
		}
		
	}

}