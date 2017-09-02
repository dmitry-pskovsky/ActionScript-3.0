package aStar 
{
	import common.IGrid;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class HexagonAStar extends BaseAStar
	{
		
		public function HexagonAStar(grid:IGrid) 
		{
			super(grid);
		}
		
		override protected function getNeighbours(square:Square):Vector.<Square> 
		{
			var neighbours:Vector.<Square> = new Vector.<Square>();
			
			if (_grid.checkFreeCell(square.x, square.y + 1) && !isInCloseList(new Square(square.x, square.y + 1)))				// x, y + 1
				neighbours.push(new Square(square.x, square.y + 1));
			if (_grid.checkFreeCell(square.x, square.y - 1) && !isInCloseList(new Square(square.x, square.y - 1)))				// x, y - 1
				neighbours.push(new Square(square.x, square.y - 1));
			if (_grid.checkFreeCell(square.x + 1, square.y) && !isInCloseList(new Square(square.x + 1, square.y)))				// x + 1, y
				neighbours.push(new Square(square.x + 1, square.y));
			if (_grid.checkFreeCell(square.x - 1, square.y) && !isInCloseList(new Square(square.x - 1, square.y)))				// x - 1, y
				neighbours.push(new Square(square.x - 1, square.y));
				
			if (square.y % 2 == 0)
			{
				if (_grid.checkFreeCell(square.x - 1, square.y + 1) && !isInCloseList(new Square(square.x - 1, square.y + 1)))				// x - 1, y + 1
					neighbours.push(new Square(square.x - 1, square.y + 1));
				if (_grid.checkFreeCell(square.x - 1, square.y - 1) && !isInCloseList(new Square(square.x - 1, square.y - 1)))				// x - 1, y - 1
					neighbours.push(new Square(square.x - 1, square.y - 1));
			}
			else
			{
				if (_grid.checkFreeCell(square.x + 1, square.y + 1) && !isInCloseList(new Square(square.x + 1, square.y + 1)))				// x + 1, y + 1
					neighbours.push(new Square(square.x + 1, square.y + 1));
				if (_grid.checkFreeCell(square.x + 1, square.y - 1) && !isInCloseList(new Square(square.x + 1, square.y - 1)))				// x + 1, y - 1
					neighbours.push(new Square(square.x + 1, square.y - 1));
			}
				
			return neighbours;
		}
		
	}

}