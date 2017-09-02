package  {
	import character.Character;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	
	public class DisplayObjectsContainer extends Sprite {
		
		private var _characters:Vector.<Character>;
		
		public function DisplayObjectsContainer() {
			super();
			_characters = new Vector.<Character>();
		}
		
		public function addObject(object:Character):void {
			addChild(object.body);
			_characters.push(object);
			object.update();
		}
		
		public function update():void {
			for (var i:int = 0; i < _characters.length; i++)
			{
				_characters[i].update();
			}
		}
		
		public function clear():void {
			var n:int = numChildren;
			for (var i:int = 0; i < n; i++)
			{
				removeChild(getChildAt(0));
			}
			_characters = new Vector.<Character>();
		}
		
	}

}