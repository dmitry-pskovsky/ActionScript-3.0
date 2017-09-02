package world2D.common 
{
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface ISearchPathAlgorithm 
	{
		function setPath(cell1:ICell, cell2:ICell):Vector.<ICell>;
	}
	
}