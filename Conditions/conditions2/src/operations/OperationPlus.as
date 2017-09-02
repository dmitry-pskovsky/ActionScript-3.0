package operations 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperationPlus implements IOperation 
	{
		
		public function OperationPlus() 
		{
			
		}
		
		/* INTERFACE IOperator */
		
		public function apply(operand1:Number, operand2:Number):Number 
		{
			return operand1 + operand2;
		}
		
		public function traceValue():String 
		{
			return "+";
		}
		
		public function get priority():int 
		{
			return OperationPriority.LOW;
		}
		
	}

}