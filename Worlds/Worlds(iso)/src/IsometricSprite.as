package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class IsometricSprite extends Sprite 
	{
		var back:Sprite = new Sprite();
		public function IsometricSprite(_sprite:Sprite) 
		{
			//back.scaleY = 0.5;
			
			graphics.beginFill(0x4FB054);
			graphics.drawRect(0, 0, 200, 200);
			
			_sprite.rotation = 45;
			
			back.addChild(_sprite);
			
			addChild(back);
		}
		
		public function decartToIzo (x:Number, y:Number):Point {
			var i:Number = y + x;
			var j:Number = y - x;
			return new Point(i,j);
		}
	}

}