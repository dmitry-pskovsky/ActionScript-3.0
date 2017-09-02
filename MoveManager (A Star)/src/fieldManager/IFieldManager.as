package fieldManager 
{
	import common.ICell;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IFieldManager extends IDisplayObject 
	{
		function setField(x:int, y:int, state:int):void;
		function getField(x:int, y:int):int;
		function getCellByPosition(x:int, y:int):ICell;
		function getPositionByCell(cell:ICell):Point;
		function set editingMode(value:Boolean):void;
	}
	
}