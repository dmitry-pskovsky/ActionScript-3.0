package statementLines 
{
	import operations.IOperation;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Statement 
	{
		private var _operation:IOperation;
		private var _operand1:Number;
		private var _operand2:Number;
		
		public function Statement(operand1:Number, operation:IOperation, operand2:Number) 
		{
			_operand1 = operand1;
			_operand2 = operand2;
			_operation = operation;
		}
		
		public function get result():Number 
		{
			return _operation.apply(_operand1, _operand2);
		}
		
		public function traceNext():String
		{
			return _operation.traceValue() + _operand2.toString();
		}
		
		public function traceFirst():String
		{
			return _operand1.toString() + _operation.traceValue() + _operand2.toString();
		}
		
	}

}