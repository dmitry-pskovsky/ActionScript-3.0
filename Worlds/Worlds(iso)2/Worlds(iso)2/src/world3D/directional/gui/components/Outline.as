package world3D.directional.gui.components {
	import flash.display.Shape;
	
	
	public class Outline extends Shape {
		
		public function Outline() {
			
		}
		
		public function draw(width:int, height:int, color:uint, ellipseWidth:Number = 0.0, ellipseHeight:Number = 0.0, thickness:Number = 1.0, alpha:Number = 1.0):void {
			graphics.lineStyle(thickness, color, alpha);
			graphics.drawRoundRect(0, 0, width, height, ellipseWidth, ellipseHeight);  
		}
		
		public function clear():void {
			graphics.clear();
		}
		
	}

}