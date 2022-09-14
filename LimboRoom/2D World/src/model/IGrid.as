package model
{
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IGrid 
	{
		function getCell(x:int, y:int):int;
		function setCell(x:int, y:int, state:int):void;
		function isFreeCell(x:int, y:int):Boolean;
		function get width():int;
		function get height():int;
	}
	
}