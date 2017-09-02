package  
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class MoveManager extends EventDispatcher
	{
		
		private var _pathBD:BitmapData;
		private var _character:ICharacter;
		private var _step:int = 4;
		private var _direction:Number;
		private var _workAngle:Number;
		private var _grid:IGrid;
		private var _destination:Point;
		
		private var _targetX:int;
		private var _targetY:int;
		
		public static const CHARACTER_MOVE_COMPLETE:String = "characterMoveComplete";
		public static const CHARACTER_GET_TO_DESTINATION:String = "CharacterGetToDestination";
		
		public function MoveManager() 
		{

		}
		
		public function initialize(character:ICharacter, grid:IGrid):void 
		{
			_character = character;
			_grid = grid;
			
			_character.addEventListener(MoveManager.CHARACTER_MOVE_COMPLETE, onCharacterMoveComplete);
		}
		
		public function setPath(destination:Point):void 
		{
			_destination = destination;
			navigate(_destination);
		}
		
		private function onCharacterMoveComplete(event:Event):void 
		{
			navigate(_destination);
		}
		
		private function navigate(destination:Point):void
		{
			var dx:Number = destination.x - _character.x;
			var dy:Number = destination.y - _character.y;
			var angle:Number = Math.atan2(dy, dx);
			var dist:Number = Math.sqrt(dx * dx + dy * dy);
			
			if (dist > _step) 
			{
				_targetX = _character.x + _step * Math.cos(angle);
				_targetY = _character.y + _step * Math.sin(angle);
		 
				if(_grid.checkCell(_targetX, _targetY))
				{
					var dAngle:Number = dAngleRadian(_direction, angle);
					_workAngle = angle + dAngle * .8;
					
					for (var i:int = 0; i < 360; i += 15) 
					{
						for (var j:int = -1; j <= 1; j += 2) 
						{
							var a:Number = _workAngle + radian(i) * j;
							var tempX:Number = _character.x + _step * Math.cos(a);
							var tempY:Number = _character.y + _step * Math.sin(a);
							
							if(!_grid.checkCell(tempX, tempY))
							{
								_targetX = tempX;
								_targetY = tempY;
								break;
							}
						}
					}
				}
				
				var timeDx:Number = _targetX - _character.x;
				var timeDy:Number = _targetY - _character.y;
				
				_direction = Math.atan2(timeDy, timeDx);
				dAngle = dAngleDegree(_direction * 180 / Math.PI, _character.rotation);
				
				_character.rotation += dAngle * .2;
				_character.move(_targetX, _targetY);
			} 
			else 
			{
				dispatchEvent(new Event(MoveManager.CHARACTER_GET_TO_DESTINATION));
			}
		}
		
		private function dAngleRadian (a1:Number, a2:Number):Number
		{
			var da:Number = a1 - a2;
			if (da > Math.PI) 
			{
				da = -Math.PI * 2 + da;
			} 
			else if (da < -Math.PI) 
			{
				da = Math.PI * 2 + da;
			}
			return da;
		}
		
		private function dAngleDegree(a1:Number, a2:Number):Number
		{
			var da:Number = a1 - a2;
			if (da > 180) {
				da = -360 + da;
			} else if (da < -180) {
				da = 360 + da;
			}
			return da;
		}
		
		private function degree(a:Number):Number 
		{
			return a / Math.PI * 180;
		}
		
		private function radian(a:Number):Number
		{
			return a / 180 * Math.PI;
		}
		
	}

}