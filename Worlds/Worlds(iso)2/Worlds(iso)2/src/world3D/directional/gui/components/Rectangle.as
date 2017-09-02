package world3D.directional.gui.components {
	import flash.display.Sprite;
	
	
	public class Rectangle extends Sprite {
		
		public function Rectangle() {
			
		}
		
		public function draw(width:int, height:int, color:uint, ellipseWidth:Number = 0.0, ellipseHeight:Number = 0.0, alpha:Number = 1.0):void {
			graphics.beginFill(color, alpha);
			graphics.drawRoundRect(0, 0, width, height, ellipseWidth, ellipseHeight);
		}
		
		public function clear():void {
			graphics.clear();
		}
		
	}

}