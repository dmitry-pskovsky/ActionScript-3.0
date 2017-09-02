package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class ArrowClass extends Sprite 
	{
		
		public function ArrowClass() 
		{
			var arrow:Arrow = new Arrow();
			addChild(arrow);
		}
		
		override public function get rotation():Number 
		{
			return super.rotation;
		}
		
		override public function set rotation(value:Number):void 
		{
			super.rotation = value;
		}
		
	}

}