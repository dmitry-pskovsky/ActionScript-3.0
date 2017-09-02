package aStar 
{
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IGrid 
	{
		function getCell(x:int, y:int):int;
		function setCell(x:int, y:int, state:int):void;
	}
	
}