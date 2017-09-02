package 
{
	import characters.Character;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		private var _chracter:Character;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_chracter = new Character(new Point(10, 10));
			addChild(_chracter.body);
			
			stage.addEventListener(MouseEvent.CLICK, onClickHandler);
		}
		
		private function onClickHandler(event:MouseEvent):void 
		{
			_chracter.move(new Point(mouseX, mouseY));
		}
		
	}
	
}