package world2D.common 
{
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IGrid 
	{
		function checkFreeCell(x:int, y:int):Boolean;
		function getCell(x:int, y:int):int;
		function setCell(x:int, y:int, state:int):void;
		function get width():int;
		function get height():int;
	}
	
}