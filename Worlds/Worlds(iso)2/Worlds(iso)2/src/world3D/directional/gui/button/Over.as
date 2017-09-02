package world3D.directional.gui.button {
	import world3D.directional.gui.components.Outline;
	import world3D.directional.gui.components.Rectangle;
	import flash.display.Sprite;
	
	public class Over extends Sprite {
		
		private var _outlineWhite:Outline;
		private var _outlineBlack:Outline;
		private var _outlineGrey:Outline;
		private var _rectWhite:Rectangle;
		private var _rectBlack:Rectangle;
		
		public function Over() {
			_outlineBlack = new Outline();
			addChild(_outlineBlack);
			
			_outlineWhite = new Outline();
			addChild(_outlineWhite);
			
			_outlineGrey = new Outline();
			addChild(_outlineGrey);
						
			_rectWhite = new Rectangle();
			addChild(_rectWhite);
			
			_rectBlack = new Rectangle();
			addChild(_rectBlack);
		}
		
		
		public function draw(width:int, height:int):void {
			_outlineWhite.draw(width, height, 0xFFFFFF, 5, 5, 0.7, 0.3);
			
			_outlineBlack.draw(width + 1, height + 1, 0x000000, 5, 5, 1, 1);
			_outlineBlack.x = -0.5;
			_outlineBlack.y = -0.5;
			
			_outlineGrey.draw(width + 2, height + 2, 0x000000, 5, 5, 1, 0.2);
			_outlineGrey.x = -1;
			_outlineGrey.y = -1;
			
			_rectWhite.draw(width, height / 2, 0xEEEEEE, 1, 1, 0.1);
			_rectBlack.draw(width, height / 2, 0x000000, 1, 1, 0.1);
			_rectBlack.y = height / 2;
		}
	}

}