package {
	import aStar.HexagonAStar;
	import aStar.SquareAStar;
	import characterMoveManager.adapters.CharacterAdapter;
	import characterMoveManager.adapters.CharacterElmitiyaAdapter;
	import characterMoveManager.adapters.GridAdapter;
	import characterMoveManager.CharacterMoveManager;
	import common.Cell;
	import common.ICell;
	import common.ICharacter;
	import diagrams.Diagram3D;
	import fields.AbstractField;
	import fields.HexagonFieldManager;
	import fields.hexagons.HexagonField;
	import fields.SquareFieldManager;
	import fields.squares.SquareField;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import grid.Grid;
	
	/**
	 * ...
	 * @author Dmitry
	 */
	public class Main extends Sprite {
		
		private var _grid:Grid;
		private var _squareFieldManager:SquareFieldManager;
		private var _hexagonFieldManager:HexagonFieldManager;
		private var _iseSprite:IsometricSprite;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//stage.addEventListener(MouseEvent.CLICK, onClick);
			
			_grid = new Grid();
			_grid.initialize(19, 19);
			_grid.setField(3, 1, AbstractField.STATE_BUSY);
			_grid.setField(3, 2, AbstractField.STATE_BUSY);
			_grid.setField(3, 3, AbstractField.STATE_BUSY);
			_grid.setField(3, 4, AbstractField.STATE_BUSY);
			_grid.setField(3, 5, AbstractField.STATE_BUSY);
			_grid.setField(3, 6, AbstractField.STATE_BUSY);
			
			_squareFieldManager = new SquareFieldManager();
			_squareFieldManager.initialize(new GridAdapter(_grid), SquareField);
			//addChild(_squareFieldManager);
			
			_hexagonFieldManager = new HexagonFieldManager();
			_hexagonFieldManager.initialize(new GridAdapter(_grid), HexagonField);
			//addChild(_hexagonFieldManager);

			FieldManagersProxy.initialize(_squareFieldManager, _hexagonFieldManager);
			/*
			_hexagonFieldManager.x = _squareFieldManager.width + 20;
			_hexagonFieldManager.y = HexagonFieldManager.RADIUS + 100;
			*/
			// Initialize characters
			//var charactersSquare:Vector.<ICharacter> = new Vector.<ICharacter>();
			//var charactersHexagon:Vector.<ICharacter> = new Vector.<ICharacter>();
			
			//var charElm:CharacterElmiriya = new CharacterElmiriya(new Point(100, 100));
			//addChild(charElm.body);
			//charactersSquare.push(new CharacterElmitiyaAdapter(charElm, _squareFieldManager));

			
			var _sprite:Sprite = new Sprite();
			_sprite.graphics.beginFill(0x1C1B34, 1);
			_sprite.graphics.drawRect(0, 0, 100, 100);
			
			_iseSprite = new IsometricSprite(_sprite);
			addChild(_iseSprite);
			
			_iseSprite.x = 100;
			_iseSprite.y = 100;
			
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			
			
			//var characterManager2:CharacterMoveManager = new CharacterMoveManager();
			//characterManager2.initialize(new GridAdapter(_grid), charactersSquare, new SquareAStar(new GridAdapter(_grid)));
			
		}
		
		private function onMouseMove(event:MouseEvent):void 
		{
			trace(_iseSprite.decartToIzo(_iseSprite.mouseX, _iseSprite.mouseY));
		}
		
	}
	
}