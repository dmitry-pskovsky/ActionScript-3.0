package fields.hexagons {
	import common.HXMath;
	import fields.visualize.ColorProperties;
	import flash.geom.Point;
	
	public class HexagonField extends AbstractHexagonField {
		
		private var _neighbours:Vector.<HexagonField>;
		private var _radius:int;
		
		public function HexagonField() {
			
		}
		
		override public function initialize(radius:int):void {
			_neighbours = new Vector.<HexagonField>(6);
			_radius = radius;
			
			setState(_state);
		}
		
		private function drow(lineColor:ColorProperties, fillColor:ColorProperties):void {
			var deg:int = 0;
			var point:Point;
			
			var radius:int = _radius - 2;
			graphics.clear();
			
			graphics.lineStyle(1, lineColor.color, lineColor.alpha);
			point = new Point(Math.sin(HXMath.getRadians(deg)) * radius, Math.cos(HXMath.getRadians(deg)) * radius);
			graphics.beginFill(fillColor.color, fillColor.alpha);
			graphics.moveTo(point.x, point.y);
			for (var i:int = 0; i < 6; i++) 
			{
				deg += 60; 
				point = new Point(Math.sin(HXMath.getRadians(deg)) * radius, Math.cos(HXMath.getRadians(deg)) * radius);
				graphics.lineTo(point.x, point.y);
			}
			graphics.endFill();	
		}
		
		public function initializeNeighbour(index:int, neighbour:HexagonField):void {
			if (index > 5)
				return;
			_neighbours[index] = neighbour;
		}
		
		override public function setState(state:int):void
		{
			super.setState(state);	
			
			switch (_state) {
				case STATE_EMPTY :
					drow(visualizeType.getLineColor(STATE_EMPTY), visualizeType.getFillColor(STATE_EMPTY));
				break;
				case STATE_WAY :
					drow(visualizeType.getLineColor(STATE_WAY), visualizeType.getFillColor(STATE_WAY));
				break;
				case STATE_BUSY :
					drow(visualizeType.getLineColor(STATE_BUSY), visualizeType.getFillColor(STATE_BUSY));
				break;
			}
		}
		
	}

}