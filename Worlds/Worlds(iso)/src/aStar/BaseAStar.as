package aStar
{
	import aStar.Square;
	import common.ICell;
	import common.IGrid;
	import common.ISearchPathAlgorithm;
	import flash.display.IGraphicsData;
	import fields.AbstractField;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class BaseAStar implements ISearchPathAlgorithm
	{
		protected var _grid:IGrid;		
		
		private var _openList:Array;
		private var _closeList:Array;
		private var _destinationPoint:Square;
		private var _currentSquare:Square;
		private var _wayCells:Vector.<ICell>;
		
		private var _done:Boolean = false;
		
		public function BaseAStar(grid:IGrid) {
			_grid = grid;
			_openList = [];
			_closeList = [];
		}
		
		public function setPath(cell1:ICell, cell2:ICell):Vector.<ICell> {
			
			_wayCells = new Vector.<ICell>();
			
			_destinationPoint = new Square(cell2.x, cell2.y);
			
			_openList.push(new Square(cell1.x, cell1.y, 0, 0));
			
			while (!_done)
			{
				_currentSquare = getLessFSquareOpenList();
				_openList.splice(_openList.indexOf(_currentSquare), 1);
				
				_closeList.push(_currentSquare);
				
				var neighbours:Vector.<Square> = getNeighbours(_currentSquare);
				
				// add to openlist
				for each (var square:Square in neighbours)
				{
					addInOpenList(square);
				}
				
				// set parent
				for each (square in neighbours)
				{
					square.initializeParent(_currentSquare);
				}
				
				// initialize H
				for each (square in neighbours)
				{
					square.initializeH(new Square(cell2.x, cell2.y));
				}
				
				if (_openList.length == 0)
					_done = true;
			}
			
			for each (square in _openList)
			{
				if (square.x == _destinationPoint.x && square.y == _destinationPoint.y)
					selectSquare(square);
			}
			
			reset();
			return _wayCells.reverse();
		}
		
		public function reset():void
		{
			_openList = [];
			_closeList = [];
			_currentSquare = null;
			_done = false;
		}
		
		private function selectSquare(square:Square):void 
		{
			_wayCells.push(square);
			if (square.parent)
				selectSquare(square.parent);
		}
		
		protected function getNeighbours(square:Square):Vector.<Square>
		{
			var neighbours:Vector.<Square> = new Vector.<Square>();
			return neighbours;
		}
		
		protected function isInCloseList(square:Square):Boolean
		{
			for each (var listSquare:Square in _closeList)
			{
				if (square.x == listSquare.x && square.y == listSquare.y)
					return true;
			}
			return false
		}
		
		private function addInOpenList(square:Square):void 
		{
			if (square.x == _destinationPoint.x && square.y == _destinationPoint.y)
				_done = true;
			
			for each (var squareOpen:Square in _openList)
			{
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