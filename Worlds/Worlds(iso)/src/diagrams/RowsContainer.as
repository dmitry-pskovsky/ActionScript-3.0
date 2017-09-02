package diagrams 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class RowsContainer extends BottomLayer
	{
		private var _rowsDistance:int;
		
		public function RowsContainer() 
		{
			super();
			
			
			addDiagramRow(1, 1, 1);
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