package model 
{

	/**
	 * ...
	 * @author 
	 */

	public interface IClassComponent 
	{
		function get importText():Vector.<String>;
		function get declarationText():String;
		function get initializationText():String;
		function get destroyText():String;
	}
}