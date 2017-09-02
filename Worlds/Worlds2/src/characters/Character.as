package characters 
{
	import characters.animationManager.CharacterAnimationManager;
	import characters.BaseCharacter;
	import common.ICell;
	import common.IGrid;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Character extends BaseCharacter 
	{
		private var _smothlyMoveManager:SmothlyMoveManager;
		
		public static var MOVE_COMPLETE:String = "MoveComplete";
		
		public function Character(position:Point) 
		{
			var arrow:Arrow = new Arrow;
			arrow.x = position.x;
			arrow.y = position.y;
			arrow.scaleX = arrow.scaleY = 0.5;
			
			super(arrow, new CharacterAnimationManager(), position, 0.5);
		}
		
	}

}