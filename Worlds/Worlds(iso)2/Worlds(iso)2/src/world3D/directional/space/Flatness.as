package world3D.directional.space {
	import flash.display.Sprite;
	
	public class Flatness extends Sprite {
		
		public function Flatness() {
			graphics.lineStyle(1, 0xFFFFFF, 1);
			graphics.drawRect(0, 0, 200, 200);
			
			graphics.lineStyle(1, 0xFFFFFF, 1);
			for (var i:int = 10; i < 200; i += 10)
			{
				graphics.moveTo(i, 0);
				graphics.lineTo(i, 200);
				
				graphics.moveTo(0, i);
				graphics.lineTo(200, i);
			}
		}
		
	}

}