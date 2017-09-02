package 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		private var _moveManager:MoveManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_moveManager = new MoveManager();
			
			var map:Map = new Map();
			addChild(map);
			var bitmapData:BitmapData = new BitmapData(map.width, map.height, false, 0x000000);
			bitmapData.draw(map);
			
			var arrow:Arrow = new Arrow();
			addChild(arrow);
			
			_moveManager.initialize(new SpriteCharacterAdapter(arrow), new BitmapDataGridAdapter(bitmapData));
			_moveManager.addEventListener(MoveManager.CHARACTER_GET_TO_DESTINATION, onGetToDesination);
			_moveManager.setPath(new Point(200, 200));
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onGetToDesination(event:Event):void 
		{
			
		}
		
		private function onEnterFrame(event:Event):void 
		{
			
		}
		
	}
	
}