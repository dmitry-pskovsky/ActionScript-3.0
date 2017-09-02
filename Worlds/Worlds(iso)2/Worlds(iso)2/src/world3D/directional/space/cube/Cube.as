package world3D.directional.space.cube {
	import flash.display.Sprite;
	
	public class Cube extends Sprite {
		
		public static const WIDTH:int = 150;
		public static const HEIGHT:int = 150;
		
		private var _side1:Sprite;
		private var _side2:Sprite;
		private var _side3:Sprite;
		private var _side4:Sprite;
		private var _side5:Sprite;
		private var _side6:Sprite;
		
		public function Cube() {
			_side1 = new CubeSide();
			_side1.x = - _side1.width / 2;
			_side1.y = - _side1.height / 2;
			addChild(_side1);
			_side2 = new CubeSide();
			_side2.x = - _side2.width / 2;
			_side2.y = - _side2.height / 2;
			addChild(_side2);
			_side3 = new CubeSide();
			_side3.x = - _side3.width / 2;
			_side3.y = - _side3.height / 2;
			addChild(_side3);
			_side4 = new CubeSide();
			_side4.x = - _side4.width / 2;
			_side4.y = - _side4.height / 2;
			addChild(_side4);
			_side5 = new CubeSide();
			_side5.x = - _side5.width / 2;
			_side5.y = - _side5.height / 2;
			addChild(_side5);
			_side6 = new CubeSide();
			_side6.x = - _side6.width / 2;
			_side6.y = - _side6.height / 2;
			addChild(_side6);
		}
		
	}

}