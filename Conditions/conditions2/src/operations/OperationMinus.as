package operations 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperationMinus implements IOperation 
	{
		
		public function OperationMinus() 
		{
			
		}
		
		/* INTERFACE operations.IOperation */
		
		public function apply(operand1:Number, operand2:Number):Number 
		{
			return operand1 - operand2;
		}
		
		public function traceValue():String 
		{
			return "-";
		}
		
		public function get priority():int 
		{
			return OperationPriority.LOW;
		}
		
	}

}