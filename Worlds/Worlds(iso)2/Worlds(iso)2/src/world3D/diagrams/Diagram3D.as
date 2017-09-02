package world3D.diagrams 
{
	import grid.Grid;
	import world2D.common.IGrid;
	import world3D.events.ProgramEvent;
	import flash.display.Stage;
	import org.papervision3d.objects.primitives.Plane;
	import world3D.MouseRotatableSpace;
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
		private var _grid:IGrid;
		
		public function Diagram3D(stage:Stage, grid:IGrid) 
		{
			_stage = stage;
			_grid = grid;
			//var diagramInfo:DiagramInfo = new DiagramInfo();
			//_stage.addChild(diagramInfo);
			
			//ProgrammRoot.addEventListener(ProgramEvent.GET_DIAGRAMM_INFO, onGetInfoHandler);
			onGetInfoHandler(null);
		}
		
		private function onGetInfoHandler(event:ProgramEvent):void 
		{
			if (_mouseRotatableSpace)
			{
				lastRotationX = _mouseRotatableSpace.lastRotationX;
				lastRotationY = _mouseRotatableSpace.lastRotationY;
				_mouseRotatableSpace.parent.removeChild(_mouseRotatableSpace);
				_mouseRotatableSpace = null;
			}
			
			_mouseRotatableSpace = new MouseRotatableSpace(false);
			_rowsContainer = new RowsContainer(_grid);
			_mouseRotatableSpace.contentObject = _rowsContainer;
			_mouseRotatableSpace.container.rotationX = 135;
			_mouseRotatableSpace.container.rotationY = 18;
			_mouseRotatableSpace.lastRotationX = 135;
			_mouseRotatableSpace.lastRotationY = 18;
			
			_mouseRotatableSpace.x = 770;
			_mouseRotatableSpace.y = -180;
			
			_mouseRotatableSpace.scaleX = -1;
			_stage.addChild(_mouseRotatableSpace);
		}
		
		public function finalize():void
		{
			if (_mouseRotatableSpace && _mouseRotatableSpace.parent)
				_mouseRotatableSpace.parent.removeChild(_mouseRotatableSpace);
		}
		
	}

}