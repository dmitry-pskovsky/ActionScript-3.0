package series 
{
	import operations.IOperation;
	import operations.OperationMinus;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesElement implements ISeriesElement
	{
		private var _value:Number;
		private var _operation:IOperation;
		
		public function SeriesElement(operation:IOperation, value:Number) 
		{
			_operation = operation;
			_value = value;
		}
		
		public function get value():Number 
		{
			return _value;
		}
		
		public function set value(value:Number):void 
		{
			_value = value;
		}
		
		public function get operation():IOperation 
		{
			return _operation;
		}
		
		public function set operation(value:IOperation):void 
		{
			_operation = value;
		}
		
	}

}