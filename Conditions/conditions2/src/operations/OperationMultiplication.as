package operations 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperationMultiplication implements IOperation
	{
		
		public function OperationMultiplication() 
		{
			
		}
		
		/* INTERFACE operations.IOperation */
		
		public function apply(operand1:Number, operand2:Number):Number 
		{
			return operand1 * operand2;
		}
		
		public function traceValue():String 
		{
			return "*";
		}
		
		public function get priority():int 
		{
			return OperationPriority.HIGHT;
		}
		
	}

}