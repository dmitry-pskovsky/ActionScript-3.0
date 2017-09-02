package world3D.directional 
{
	import world3D.directional.gui.IDisplayObject;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IProgram extends IDisplayObject
	{
		function setSize(width:int, height:int):void;
		function fullScreenListener(width:int, height:int):void;
	}
	
}