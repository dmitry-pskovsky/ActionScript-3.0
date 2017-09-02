package  
{
	import events.ProgramEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.view.BasicView;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class MouseRotatableSpace extends BasicView
	{
		public static const COMPLETE_LOAD_OBJECT:String = 'CompleteLoadObject';
		
		private var _contentObject:DisplayObject3D;
		private var _drag:Boolean;
		private var _completeLoadEventFlag:Boolean;
		
		private var _container:DisplayObject3D;
		
		private var _lastRotationY:int;
		private var _lastRotationX:int;
		private var _mouseDownX:int;
		private var _mouseDownY:int;
		private var _offsetX:int;
		private var _offsetY:int;
		
		private var _borderWidth:int;
		private var _borderHeight:int;
		
		private var _touchArea:Sprite;
		private var _border:Boolean;
			
		public function MouseRotatableSpace(border:Boolean = false) 
		{
			_completeLoadEventFlag = false;
			_border = border;
			
			_borderWidth = 400;
			_borderHeight = 400;
			
			super(_borderWidth, _borderHeight, false);
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, false, 0, true);
			startRendering();
		}
		
		private function addedToStageHandler(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			createTouchArea();
			
			_touchArea.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		
		private function createTouchArea():void 
		{
			_touchArea = new Sprite();
		
			if (_border)
				drawOutLine();
				
			_touchArea.graphics.lineStyle(1, 0x000000, 0);
			_touchArea.graphics.beginFill(0x000000, 0.01);
			_touchArea.graphics.drawRect(0, 0, _borderWidth - 1, _borderHeight - 1);
			
			addChild(_touchArea);
		}
		
		private function drawOutLine():void 
		{
			_touchArea.graphics.clear();
			
			_touchArea.graphics.lineStyle(1, 0x000000);
			_touchArea.graphics.drawRect(0, 0, _borderWidth, _borderHeight);
			
			_touchArea.graphics.lineStyle(1, 0xA4A4A4);
			_touchArea.graphics.drawRect(-1, -1, _borderWidth + 2, _borderHeight + 2);
		}
		
		private function mouseUpHandler(event:MouseEvent):void 
		{
			if (_drag && _contentObject)
			{
				lastRotationY = _container.rotationY;
				lastRotationX = _container.rotationX;
			}
			_drag = false;
		}
		
		private function mouseDownHandler(event:MouseEvent):void 
		{
			_drag = true;
			_mouseDownX = mouseX;
			_mouseDownY = mouseY;
		}
		
		override protected function onRenderTick(event:Event = null):void 
		{
			calculateOffsets();
			if (_drag && _contentObject)
			{
				calculateOffsets();
				_container.rotationY = lastRotationY + _offsetY / 5;
				_container.rotationX = lastRotationX - _offsetX / 5;
				if (_container.rotationY >= 85) 
					_container.rotationY = 85;
				if (_container.rotationY <= -85)
					_container.rotationY = -85;
			}
			
			super.onRenderTick(event);
			
			ProgrammRoot.dispatchEvent(new ProgramEvent(ProgramEvent.ON_RENDER_TICK));
			
			dispatchCompleteLoadEvent();
		}
		
		private function dispatchCompleteLoadEvent():void 
		{
			if (!_completeLoadEventFlag)
			{
				dispatchEvent(new Event(COMPLETE_LOAD_OBJECT));
				_completeLoadEventFlag = true;
			}
		}
		
		private function calculateOffsets():void 
		{
			_offsetX = mouseX - _mouseDownX;
			_offsetY = mouseY - _mouseDownY;
		}
		
		public function set contentObject(value:DisplayObject3D):void 
		{
			if (_contentObject && _contentObject.parent)
			{
				_contentObject.parent.removeChild(_contentObject);
				_contentObject = null;
			}
				
			
			_contentObject = value;
			_contentObject.rotationZ = -90;
				
			_container = new DisplayObject3D();
			_container.addChild(_contentObject);
			_container.rotationZ = 90;
			
			scene.addChild(_container);
		}
		
		public function get lastRotationY():int 
		{
			return _lastRotationY;
		}
		
		public function set lastRotationY(value:int):void 
		{
			_lastRotationY = value;
		}
		
		public function get lastRotationX():int 
		{
			return _lastRotationX;
		}
		
		public function set lastRotationX(value:int):void 
		{
			_lastRotationX = value;
		}
		
		public function get container():DisplayObject3D 
		{
			return _container;
		}
		
	}

}