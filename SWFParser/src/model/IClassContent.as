package model 
{
	import parsers.components.IComponent;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public interface IClassContent extends IComponent
	{
		function addComponentImports(value:String):void;
		function addComponentDeclaration(value:String):void;
		function addComponentInitialization(value:String):void;
		function addComponentDestroy(value:String):void;
	}
}