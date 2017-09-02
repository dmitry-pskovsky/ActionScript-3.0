package operations 
{
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IOperation 
	{
		function apply(operand1:Number, operand2:Number):Number
		function traceValue():String;
	}
	
}