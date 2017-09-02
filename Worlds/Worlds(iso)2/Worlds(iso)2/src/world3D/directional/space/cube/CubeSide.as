package world3D.directional.space.cube {
	import flash.display.Sprite;
	
	public class CubeSide extends Sprite {
		
		public function CubeSide() {
			graphics.lineStyle(2, 0x000000, 1.0);
			graphics.drawRect(0, 0, Cube.WIDTH, Cube.HEIGHT);
		}
		
	}

}