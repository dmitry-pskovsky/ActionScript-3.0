package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import squares.SquareProperties;
	import squares.SquareView;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			

			for (var i:int = 0; i < 10; i++) 
			{
				var squareView:SquareView = new SquareView(new SquareProperties(i * 20, 0, 20, 20));
				addChild(squareView);
			}
		}
		
	}
	
}