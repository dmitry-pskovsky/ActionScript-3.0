package model {
	import flash.geom.Point;

	public class AStar {
		private var _grid:IGrid;
		private var _openList:Array;
		private var _closeList:Array;
		private var _destinationPoint:Square;
		private var _currentSquare:Square;
		private var _wayCells:Vector.<Point>;
		
		private var _done:Boolean = false;
		
		public function AStar(grid:IGrid) {
			_grid = grid;
			_openList = [];
			_closeList = [];
		}
		
		public function setPath(cell1:Point, cell2:Point):Vector.<Point> {
			_openList = new Array();

			_currentSquare = null;

			_closeList = [];

			_done = false;

			_wayCells = new Vector.<Point>();
			
			_destinationPoint = new Square(cell2.x, cell2.y);
			
			_openList.push(new Square(cell1.x, cell1.y, 0, 0));
			
			while (!_done) {
				_currentSquare = getLessFSquareOpenList();
				_openList.splice(_openList.indexOf(_currentSquare), 1);
				
				_closeList.push(_currentSquare);
				
				var neighbours:Vector.<Square> = getNeighbours(_currentSquare);
				
				// add to openlist
				for each (var square:Square in neighbours) {
					addInOpenList(square);
				}
				
				// set parent
				for each (square in neighbours) {
					square.initializeParent(_currentSquare);
				}
				
				// initialize H
				for each (square in neighbours) {
					square.initializeH(new Square(cell2.x, cell2.y));
				}
				
				if (_openList.length == 0)
					_done = true;
			}
			
			for each (square in _openList) {
				if (square.x == _destinationPoint.x && square.y == _destinationPoint.y)
					selectSquare(square);
			}

			return _wayCells.reverse();
		}
		
		private function selectSquare(square:Square):void {
			_wayCells.push(new Point(square.x, square.y));
			if (square.parent)
				selectSquare(square.parent);
		}
		
		private function getNeighbours(square:Square):Vector.<Square> {
			var neighbours:Vector.<Square> = new Vector.<Square>();
			if (_grid.isFreeCell(square.x + 1, square.y) && !isInCloseList(new Square(square.x + 1, square.y)))				// x + 1, y
				neighbours.push(new Square(square.x + 1, square.y));
			if (_grid.isFreeCell(square.x + 1, square.y + 1) && !isInCloseList(new Square(square.x + 1, square.y + 1)))	// x + 1, y + 1
				neighbours.push(new Square(square.x + 1, square.y + 1));
			if (_grid.isFreeCell(square.x - 1, square.y) && !isInCloseList(new Square(square.x - 1, square.y)))				// x - 1, y
				neighbours.push(new Square(square.x - 1, square.y));
			if (_grid.isFreeCell(square.x, square.y - 1) && !isInCloseList(new Square(square.x, square.y - 1)))				// x, y - 1
				neighbours.push(new Square(square.x, square.y - 1));
			if (_grid.isFreeCell(square.x - 1, square.y - 1) && !isInCloseList(new Square(square.x - 1, square.y - 1)))	// x - 1, y - 1
				neighbours.push(new Square(square.x - 1, square.y - 1));
			if (_grid.isFreeCell(square.x + 1, square.y - 1) && !isInCloseList(new Square(square.x + 1, square.y - 1)))	// x + 1, y - 1
				neighbours.push(new Square(square.x + 1, square.y - 1));
			if (_grid.isFreeCell(square.x - 1, square.y + 1) && !isInCloseList(new Square(square.x - 1, square.y + 1)))	// x - 1, y + 1
				neighbours.push(new Square(square.x - 1, square.y + 1));
			if (_grid.isFreeCell(square.x, square.y + 1) && !isInCloseList(new Square(square.x, square.y + 1)))	// x, y + 1
				neighbours.push(new Square(square.x, square.y + 1));

			return neighbours;
		}
		
		private function isInCloseList(square:Square):Boolean {
			for each (var listSquare:Square in _closeList) {
				if (square.x == listSquare.x && square.y == listSquare.y)
					return true;
			}
			return false
		}
		
		private function addInOpenList(square:Square):void {
			if (square.x == _destinationPoint.x && square.y == _destinationPoint.y)
				_done = true;
			
			for each (var squareOpen:Square in _openList) {
				if (squareOpen.x == square.x && squareOpen.y == square.y)
					return;
			}
			
			_openList.push(square);
		}
		
		private function getLessFSquareOpenList():Square {
			_openList.sortOn("f", Array.NUMERIC);
			return _openList[0];
			
		}
		
	}

}