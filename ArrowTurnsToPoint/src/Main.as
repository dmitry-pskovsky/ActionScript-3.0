package 
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		private var _smothlyMovemanager:SmothlyMoveManager;
		private var _arrow:Arrow;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
			
			_arrow = new Arrow();
			_arrow.x = 300;
			_arrow.y = 300;
			addChild(_arrow);
			_smothlyMovemanager = new SmothlyMoveManager();
			
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			_smothlyMovemanager.moveTo(_arrow, event.stageX, event.stageY);
		}
		
	}
	
}