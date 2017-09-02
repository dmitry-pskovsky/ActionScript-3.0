package diagrams 
{
	import events.ProgramEvent;
	import flash.display.Stage;
	import org.papervision3d.objects.primitives.Plane;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Diagram3D extends BottomLayer
	{
		private var _rowsContainer:RowsContainer;
		private var _mouseRotatableSpace:MouseRotatableSpace;
		private var lastRotationX:int;
		private var lastRotationY:int;
		private var _stage:Stage;
		
		public function Diagram3D(stage:Stage) 
		{
			_stage = stage;
			
			ProgrammRoot.addEventListener(ProgramEvent.GET_DIAGRAMM_INFO, onGetInfoHandler);
			onGetInfoHandler(null);
		}
		
		private function onGetInfoHandler(event:ProgramEvent):void 
		{
			if (_mouseRotatableSpace)
			{
				/*
				lastRotationX = _mouseRotatableSpace.lastRotationX;
				lastRotationY = _mouseRotatableSpace.lastRotationY;
				_mouseRotatableSpace.parent.removeChild(_mouseRotatableSpace);
				_mouseRotatableSpace = null;
				*/
			}
			
			_mouseRotatableSpace = new MouseRotatableSpace(true);
			_rowsContainer = new RowsContainer();
			_mouseRotatableSpace.contentObject = _rowsContainer;
			
			_mouseRotatableSpace.container.rotationX = 0;
			_mouseRotatableSpace.container.rotationY = 0;
			_mouseRotatableSpace.lastRotationX = 0;
			_mouseRotatableSpace.lastRotationY = 0;
			
			_mouseRotatableSpace.x = 150;
			
			_stage.addChild(_mouseRotatableSpace);
		}
		
	}

}