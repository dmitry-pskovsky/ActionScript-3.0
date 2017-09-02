package series 
{
	import operations.IOperation;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface ISeriesElement 
	{
		function get operation():IOperation;
		function get value1():Number;
		function get value2():Number;
			
		function set operation(value:IOperation):void;
		function set value1(value:Number):void;
		function set value2(value:Number):void;
	}
	
}