package world3D.diagrams 
{
	import world2D.common.IGrid;
	import world2D.fields.AbstractField;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class RowsContainer extends BottomLayer
	{
		private var _rowsDistance:int;
		private var _grid:IGrid;
		
		public function RowsContainer(grid:IGrid) 
		{
			super();
			
			_grid = grid;
			
			for (var i:int = 0; i < _grid.width; i++) 
			{
				for (var j:int = 0; j < _grid.height; j++) 
				{
					if (grid.getCell(i, j) == AbstractField.STATE_BUSY)
						addDiagramRow(1, i * DiagramRow.DIAGRAM_WIDTH, j * DiagramRow.DIAGRAM_WIDTH);
				}
			}
			/*
			_rowsDistance = bottomLayerWidth - (rows.length * DiagramRow.DIAGRAM_WIDTH);
			_rowsDistance = _rowsDistance / rows.length;
			
			var j:int = 0;
			
			for (var i:int = ( - bottomLayerWidth / 2) + DiagramRow.DIAGRAM_WIDTH /2; i < bottomLayerWidth / 2; i += (DiagramRow.DIAGRAM_WIDTH + _rowsDistance))
			{
				if (j >= rows.length)
					continue;
					
				addDiagramRow(rows[j].size, i, 0);
				j++;
			}
			*/
		}
		
	}

}