package world3D.graphics3D 
{
	import world3D.diagrams.Diagram3D;
	import world3D.directional.gui.window.Window;
	import events.ProgramEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.papervision3d.objects.DisplayObject3D;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Graphic3D extends Sprite
	{
		private var _mouseRotatableSpace:MouseRotatableSpace;
		private var _diagram:Diagram;
		private var _graphicOptions:GraphicOptions;
		
		public function Graphic3D() 
		{
			super();
			_mouseRotatableSpace = new MouseRotatableSpace();
			
			_graphicOptions = new GraphicOptions();
			addChild(_graphicOptions);
			
			ProgrammRoot.addEventListener(ProgramEvent.GET_GRAPHIC_INFO, getInfoHandler);
			getInfoHandler(new ProgramEvent(ProgramEvent.GET_GRAPHIC_INFO, {aValue:3, bValue:0, divisionSize:30} ));

			_mouseRotatableSpace.addEventListener(MouseRotatableSpace.COMPLETE_LOAD_OBJECT, completeLoadObject);
		}
		
		private function getInfoHandler(event:ProgramEvent):void 
		{
			_diagram = new Diagram(-10, 10, 1, event.data.aValue, event.data.bValue, event.data.divisionSize);
			_mouseRotatableSpace.contentObject = _diagram;
		}
		
		private function completeLoadObject(event:Event):void 
		{
			if (_diagram)
			{	
				var _sprite:Sprite = new Sprite();
				addChild(_sprite);
				_sprite.addChild(_mouseRotatableSpace);
				
				var _window:Window = new Window(_sprite, 'Diagram', true);
				_window.x = 100;
				_window.y = 100;
				_window.content = _mouseRotatableSpace;
				addChild(_window);
				_mouseRotatableSpace.removeEventListener(MouseRotatableSpace.COMPLETE_LOAD_OBJECT, completeLoadObject);
			}
			
		}
		
	}

}