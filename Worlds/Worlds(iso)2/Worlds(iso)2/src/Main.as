package
{
	import fl.controls.Button;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import world2D.common.GridAdapter;
	import world2D.common.ICell;
	import world2D.fields.SquareFieldManager;
	import grid.Grid;
	import world2D.fields.squares.SquareField;
	import world3D.diagrams.Diagram3D;
	import world3D.diagrams.DiagramInfo;
	import world3D.diagrams.DiagramRowInfo;
	import world3D.diagrams.RowsContainer;
	import world3D.directional.gui.window.components.Content;
	import world3D.directional.gui.window.Window;
	import world3D.events.ProgramEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import world3D.graphics3D.Diagram;
	import world3D.graphics3D.Graphic3D;
	import org.papervision3d.core.geom.renderables.Line3D;
	import world3D.MouseRotatableSpace;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite
	{
		private var _mouseRotatableSpace:MouseRotatableSpace;
		private var _diagram:Diagram;
		private var _window:Window;
		
		private var _sprite:Sprite;
		private var _fieldSelecter:FieldSelecter;
		private var _isoSprite:IsometricSprite;
		
		private var _button:Button;
		private var _grid:Grid;
		private var _button2:Button;
		private var _diagram3d:Diagram3D;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			_button = new Button();
			_button.label = "3D";
			_button.height = 30;
			addChild(_button);
			
			_button2 = new Button();
			_button2.label = "2D";
			_button2.height = 30;
			_button2.y = 30;
			addChild(_button2);
			
			_button.addEventListener(MouseEvent.CLICK, onButton3DClick);
			_button2.addEventListener(MouseEvent.CLICK, onButton2DClick);
			
			
			_grid = new Grid();
			_grid.initialize(10, 10);

			onButton2DClick(null);
			
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		private function onButton2DClick(event:MouseEvent):void 
		{
			if (_isoSprite && _isoSprite.parent)
			{
				_isoSprite.parent.removeChild(_isoSprite);
				_isoSprite = null;
			}
			
			var _squareFieldManager:SquareFieldManager = new SquareFieldManager();
			_squareFieldManager.initialize(new GridAdapter(_grid), SquareField);
			
			_fieldSelecter = new FieldSelecter();
			_fieldSelecter.initialize(_squareFieldManager);
			
			_isoSprite = new IsometricSprite(_squareFieldManager);
			addChild(_isoSprite);
			_isoSprite.x = 210;
			_isoSprite.y = 0;
		}
		
		private function onButton3DClick(event:MouseEvent):void 
		{
			//removeChild(_isoSprite);
			
			if (_diagram3d)
				_diagram3d.finalize();
				
			_diagram3d = new Diagram3D(stage, new GridAdapter(_grid));
		}
		
		private function onMouseClick(e:Event):void 
		{
			var x:Number = (_isoSprite.mouseY * 2 + _isoSprite.mouseX) / Math.sqrt(2);
			var y:Number = (_isoSprite.mouseY * 2 - _isoSprite.mouseX) / Math.sqrt(2);
			
			var cell:ICell = _fieldSelecter.squareFieldManager.getCellByPosition(new Point(x, y));
			_fieldSelecter.celectCell(cell.x, cell.y);
		}
		
		private function onMouseMove(event:MouseEvent):void 
		{
			var x:Number = (_isoSprite.mouseY * 2 + _isoSprite.mouseX) / Math.sqrt(2);
			var y:Number = (_isoSprite.mouseY * 2 - _isoSprite.mouseX) / Math.sqrt(2);
			
			var cell:ICell = _fieldSelecter.squareFieldManager.getCellByPosition(new Point(x, y));
			_fieldSelecter.visualizeCell(cell.x, cell.y);

		}
		
		private function isoToCell(x:int ,y:int):Point 
		{
			return new Point(Math.round( -x / 24), Math.round( -y / 24));
		}
	
	}

}