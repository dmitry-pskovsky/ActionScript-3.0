package world3D.graphics3D 
{
	import events.ProgramEvent;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import gui.templates.GraphicOptionsTemplate;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class GraphicOptions extends Sprite
	{
		private var _template:GraphicOptionsTemplate;
		
		public function GraphicOptions() 
		{
			_template = new GraphicOptionsTemplate();
			addChild(_template);
			
			addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(event:KeyboardEvent):void 
		{
			if (event.keyCode == Keyboard.ENTER)
			{
				ProgrammRoot.dispatchEvent(new ProgramEvent(ProgramEvent.GET_GRAPHIC_INFO, { aValue:int(_template.aInput.text), bValue:int(_template.xInput.text), divisionSize:int(_template.scaleInput.text)}));
			}
		}
		
	}

}