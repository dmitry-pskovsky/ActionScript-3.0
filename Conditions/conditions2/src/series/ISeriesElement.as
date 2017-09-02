package series 
{
	import operations.IOperation;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface ISeriesElement 
	{
		function get value():Number;
		function get operation():IOperation;
		function set value(value:Number):void;
		function set operation(operation:IOperation):void;
	}
	
}