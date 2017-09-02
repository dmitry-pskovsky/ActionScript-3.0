package world3D.directional.gui.menu {
	import flash.display.Shape;
	import flash.geom.Point;
	
	public class Line extends Shape {
		
		public function Line() {
			
		}
		
		public function draw(startPoint:Point, endPoint:Point):void {
			graphics.lineStyle(1, 0x000000, 0.2);
			graphics.moveTo(startPoint.x, startPoint.y);
			graphics.lineTo(endPoint.x, endPoint.y);
			
			graphics.lineStyle(1, 0xFFFFFF, 0.2);
			graphics.moveTo(startPoint.x, startPoint.y + 1);
			graphics.lineTo(endPoint.x, endPoint.y + 1);
		}
		
	}

}